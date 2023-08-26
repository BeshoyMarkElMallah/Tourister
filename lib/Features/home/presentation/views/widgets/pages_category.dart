import 'package:flutter/material.dart';
import 'package:tourister/Features/home/presentation/views/widgets/most_visited_list_view.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/core/utils/styles.dart';

class PagesCategories extends StatelessWidget {
  const PagesCategories({super.key, required this.placeModel});
  final List<PlaceModel> placeModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Most Visited',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          MostVisitedListView(
            placeModel: placeModel,
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            'Recommended',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          MostVisitedListView(
            placeModel: placeModel,
          ),
        ],
      ),
    );
  }
}
