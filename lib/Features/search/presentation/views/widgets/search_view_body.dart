import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourister/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:tourister/Features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:tourister/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_loading_indicator.dart';
import 'package:tourister/core/widgets/custom_no_data.dart';
import 'package:tourister/core/widgets/custom_search_now.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomSearchTextField(onChanged: (value) {
                  BlocProvider.of<SearchCubit>(context).searchPlace(value);
                }),
                const SizedBox(
                  height: 100,
                ),
                const CustomLoadingIndicator(),
              ],
            ),
          );
        } else if (state is SearchSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomSearchTextField(onChanged: (value) {
                  BlocProvider.of<SearchCubit>(context).searchPlace(value);
                }),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Search Result',
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: SearchResultListView(places: state.places),
                )
              ],
            ),
          );
        } else if (state is SearchEmpty) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CustomSearchTextField(onChanged: (value) {
                    BlocProvider.of<SearchCubit>(context).searchPlace(value);
                  }),
                  const SizedBox(
                    height: 100,
                  ),
                  const NoData()
                ],
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CustomSearchTextField(onChanged: (value) {
                    BlocProvider.of<SearchCubit>(context).searchPlace(value);
                  }),
                  const SizedBox(
                    height: 100,
                  ),
                  const SearchNow()
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
