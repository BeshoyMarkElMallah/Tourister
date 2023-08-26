import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_favorite_button.dart';
import 'package:tourister/core/widgets/title_rate_row.dart';

class MostVisitedListViewItem extends StatelessWidget {
  const MostVisitedListViewItem({super.key, required this.placeModel});

  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSiteView, extra: placeModel);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * .45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                placeModel.img[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TitleRateRow(
              placeModel: placeModel,
              titleStyle:
                  Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(placeModel.distance),
                  CustomFavoriteButton(placeModel: placeModel)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
