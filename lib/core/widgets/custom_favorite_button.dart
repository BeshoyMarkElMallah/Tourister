import 'package:flutter/material.dart';
import 'package:tourister/core/models/place_model.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
    super.key,
    required this.placeModel,
    this.onPressed,
    this.size,
  });

  final PlaceModel placeModel;
  final Function()? onPressed;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: placeModel.isFav == true
          ? Icon(
              Icons.favorite,
              color: Colors.orange[400],
              size: size,
            )
          : Icon(
              Icons.favorite_border_outlined,
              size: size,
            ),
    );
  }
}
