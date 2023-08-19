import 'package:flutter/material.dart';
import 'package:tourister/Features/home/data/models/place_model.dart';
import 'package:tourister/core/utils/styles.dart';

class MostVisitedListViewItem extends StatelessWidget {
  const MostVisitedListViewItem({super.key, required this.placeModel});

  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context)
        //     .push(AppRouter.kSocialCollectionView, extra: placeModel);
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
                placeModel.img,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    placeModel.title,
                    style: Styles.textStyle14,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '4.5',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                  ),
                ),
              ],
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(placeModel.distance),
                  placeModel.isFav == true
                      ? Icon(
                          Icons.favorite,
                          color: Colors.orange[400],
                        )
                      : const Icon(Icons.favorite_border_outlined)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
