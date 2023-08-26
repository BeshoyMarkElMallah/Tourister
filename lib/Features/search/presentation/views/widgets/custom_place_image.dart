// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPlaceImage extends StatelessWidget {
  const CustomPlaceImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 3 / 2.6,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.fill,
        ),
        // child: CachedNetworkImage(
        //   imageUrl: imageUrl,
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        //   fit: BoxFit.fill,
        // ),
      ),
    );
  }
}
