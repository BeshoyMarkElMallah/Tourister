import 'package:flutter/material.dart';
import 'package:tourister/Features/search/data/static/places_list.dart';
import 'package:tourister/Features/search/presentation/views/widgets/search_result_list_view_item.dart';
import 'package:tourister/core/models/place_model.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.places,
  });
  final List<PlaceModel> places;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SearchResultListViewItem(
            placeModel: places[index],
          ),
          // child: Text("data"),
        );
      },
    );
  }
}
