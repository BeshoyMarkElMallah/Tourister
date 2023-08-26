import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/Features/search/presentation/views/widgets/custom_place_image.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_favorite_button.dart';
import 'package:tourister/core/widgets/title_rate_row.dart';

class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({super.key, required this.placeModel});
  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSiteView, extra: placeModel);
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              CustomPlaceImage(imageUrl: placeModel.img[0]),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TitleRateRow(
                      placeModel: placeModel,
                      titleStyle: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        Text(placeModel.location),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(placeModel.distance),
                        CustomFavoriteButton(placeModel: placeModel)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
