import 'package:flutter/material.dart';
import 'package:tourister/Features/home/presentation/views/widgets/custom_image_carousel.dart';
import 'package:tourister/Features/home/presentation/views/widgets/custom_site_details_appbar.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_button.dart';
import 'package:tourister/core/widgets/custom_favorite_button.dart';
import 'package:tourister/core/widgets/title_rate_row.dart';

class SiteViewBody extends StatelessWidget {
  const SiteViewBody({super.key, required this.placeModel});

  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomSiteDetailsAppBar(category: placeModel.category),
          const SizedBox(
            height: 20,
          ),
          CustomImageCarousel(placeModel: placeModel),
          const SizedBox(
            height: 10,
          ),
          TitleRateRow(
            placeModel: placeModel,
            titleStyle:
                Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              Text(placeModel.location),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(
                placeModel.description,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Book Now',
                  onPressed: () {},
                  minwidth: MediaQuery.of(context).size.width * 0.7,
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomFavoriteButton(
                  placeModel: placeModel,
                  size: MediaQuery.of(context).size.width * 0.1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
