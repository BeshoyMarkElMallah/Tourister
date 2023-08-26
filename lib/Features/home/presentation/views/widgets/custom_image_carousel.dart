import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tourister/core/models/place_model.dart';

class CustomImageCarousel extends StatelessWidget {
  const CustomImageCarousel({
    super.key,
    required this.placeModel,
  });

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: placeModel.img
          .map((e) => Builder(builder: (context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                  ),
                );
              }))
          .toList(),
      options: CarouselOptions(
          aspectRatio: 16 / 9,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height * .3,
          viewportFraction: 0.5),
    );

    // Expanded(
    //   child: Stack(
    //     children: [
    //       Container(
    //         width: double.infinity,
    //         height: MediaQuery.of(context).size.height * 8,
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(16),
    //           child: Image.asset(
    //             placeModel.img[0],
    //             fit: BoxFit.contain,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding:
    //             const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    //         child: ListView.builder(
    //           physics: const BouncingScrollPhysics(),
    //           scrollDirection: Axis.horizontal,
    //           itemCount: 5,
    //           itemBuilder: (context, index) {
    //             return Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 5, vertical: 85),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(16),
    //                 child: Image.asset(
    //                   AssetsData.pyramids,
    //                   fit: BoxFit.contain,
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
