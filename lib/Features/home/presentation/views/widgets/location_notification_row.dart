import 'package:flutter/material.dart';
import 'package:tourister/core/utils/styles.dart';

class LocationNotificationRow extends StatelessWidget {
  const LocationNotificationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on),
        Text(
          'Cairo, Egypt',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        const Icon(Icons.notifications)
      ],
    );
  }
}
