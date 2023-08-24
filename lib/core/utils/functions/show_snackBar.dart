import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/styles.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kSecondaryColor,
      content: Text(
        message,
        style: Styles.textStyle16,
      ),
    ),
  );
}
