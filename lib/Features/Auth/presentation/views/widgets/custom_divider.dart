import 'package:flutter/material.dart';
import 'package:tourister/core/utils/styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(
              child: Divider(
            thickness: 2,
          )),
          Text(
            "   $text   ",
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.normal, color: Colors.grey[700]),
          ),
          const Expanded(
              child: Divider(
            thickness: 2,
          )),
        ]);
  }
}
