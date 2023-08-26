import 'package:flutter/material.dart';
import 'package:tourister/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:tourister/core/models/place_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, this.placeModel});
  final PlaceModel? placeModel;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
