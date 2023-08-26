import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourister/Features/home/presentation/manager/cubits/pages_data_cubit/pages_data_cubit.dart';
import 'package:tourister/Features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:tourister/Features/home/presentation/views/widgets/location_notification_row.dart';
import 'package:tourister/Features/home/presentation/views/widgets/pages_category.dart';
import 'package:tourister/Features/home/presentation/views/widgets/search_settings_row.dart';
import 'package:tourister/core/utils/assets.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_loading_indicator.dart';
import 'package:tourister/core/widgets/custom_no_data.dart';

// ignore: must_be_immutable
class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});

  var data = [
    {'img': AssetsData.historic, 'title': 'Historic Sites', 'isSelected': true},
    {'img': AssetsData.rest, 'title': 'Restaurants', 'isSelected': false},
    {'img': AssetsData.cafe, 'title': 'Cafes', 'isSelected': false},
    {'img': AssetsData.beach, 'title': 'Beaches', 'isSelected': false},
  ];

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            'Location',
            style: Styles.textStyle14
                .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const LocationNotificationRow(),
          const SizedBox(
            height: 20,
          ),
          const SearchSettingsRow(),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Categories',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w500),
          ),
          CategoriesListView(data: data, controller: controller),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.48,
            width: double.infinity,
            child: PageView(
              controller: controller,
              children: [
                BlocBuilder<PagesDataCubit, PagesDataState>(
                  builder: (context, state) {
                    if (state is PagesDataLoading) {
                      return const CustomLoadingIndicator();
                    } else if (state is PagesDataLoaded) {
                      return PagesCategories(placeModel: state.data);
                    } else {
                      return const NoData();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
