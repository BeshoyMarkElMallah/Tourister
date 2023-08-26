import 'package:flutter/material.dart';
import 'package:tourister/core/models/place_model.dart';
import 'package:tourister/core/utils/styles.dart';

class TitleRateRow extends StatelessWidget {
  const TitleRateRow({
    super.key,
    required this.placeModel,
    required this.titleStyle,
  });

  final PlaceModel placeModel;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            placeModel.title,
            style: titleStyle,
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
    );
  }
}
