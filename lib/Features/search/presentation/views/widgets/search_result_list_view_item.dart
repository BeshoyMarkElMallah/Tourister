import 'package:flutter/material.dart';
import 'package:tourister/Features/search/presentation/views/widgets/custom_place_image.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/core/utils/styles.dart';

class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({super.key, required this.placeModel});
  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomPlaceImage(imageUrl: placeModel.img),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      placeModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    placeModel.location,
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        placeModel.distance,
                        style: Styles.textStyle14,
                      ),
                      const Spacer(),
                      // Bookrating(
                      //     rating: bookModel.volumeInfo.maturityRating ?? "0",
                      //     count: bookModel.volumeInfo.pageCount ?? 0),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
