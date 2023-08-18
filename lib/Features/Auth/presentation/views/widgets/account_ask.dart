import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/styles.dart';

class AccountAsk extends StatelessWidget {
  const AccountAsk({
    super.key,
    required this.text,
    this.onPressed,
    required this.sign,
  });
  final String text;
  final String sign;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              sign,
              style: Styles.textStyle18.copyWith(
                  color: kSecondaryColor, fontWeight: FontWeight.normal),
            ))
      ],
    );
  }
}
