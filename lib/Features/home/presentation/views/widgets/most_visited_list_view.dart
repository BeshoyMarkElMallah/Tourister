import 'package:flutter/material.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/Features/home/presentation/views/widgets/most_visited_listview_item.dart';

// ignore: must_be_immutable
class MostVisitedListView extends StatelessWidget {
  MostVisitedListView({
    super.key,
    required this.placeModel,
  });
  final List<PlaceModel> placeModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .37,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: placeModel.length,
          itemBuilder: (context, index) {
            return MostVisitedListViewItem(
              placeModel: placeModel[index],
            );
          }),
    );
  }
}
