import 'package:flutter/material.dart';
import 'package:tourister/Features/home/presentation/views/widgets/site_view_body.dart';
import 'package:tourister/core/models/place_model.dart';

class SiteView extends StatelessWidget {
  const SiteView({super.key, required this.placeModel});

  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SiteViewBody(
        placeModel: placeModel,
      )),
    );
  }
}
