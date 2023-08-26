import 'package:flutter/material.dart';
import 'package:tourister/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.onPressed, this.minwidth});
  final double? minwidth;

  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xfff4b45d),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      minWidth: minwidth ?? MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Text(
        text,
        style: Styles.textStyle14,
      ),
    );
  }
}
