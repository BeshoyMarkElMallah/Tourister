import 'package:flutter/material.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/Features/home/presentation/views/widgets/most_visited_listview_item.dart';
import 'package:tourister/core/utils/assets.dart';

// ignore: must_be_immutable
class MostVisitedListView extends StatelessWidget {
  MostVisitedListView({
    super.key,
  });
  List<PlaceModel> data = [
    const PlaceModel(
        category: 'Historical Sites',
        img: [AssetsData.pyramids],
        title: 'Pyramids of Giza',
        description: 'lorem',
        location: 'Giza',
        distance: '4 km',
        isFav: false),
    const PlaceModel(
        category: 'Historical Sites',
        img: [AssetsData.cairoTower],
        title: 'Cairo Tower',
        description: 'lorem',
        location: 'El Zamalek',
        distance: '500 m',
        isFav: true),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .37,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return MostVisitedListViewItem(
              placeModel: data[index],
            );
          }),
    );
  }
}
