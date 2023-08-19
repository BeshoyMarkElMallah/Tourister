import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/styles.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton(
      {super.key,
      this.onPressed,
      required this.icon,
      this.text,
      this.horipad = 10,
      this.verpad = 5,
      this.radius = 20});
  final void Function()? onPressed;
  final Widget icon;
  final String? text;
  final double horipad;
  final double verpad;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horipad, vertical: verpad),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: Colors.grey)),
      child: text == null
          ? IconButton(
              splashRadius: 30,
              splashColor: kSecondaryColor,
              onPressed: onPressed,
              icon: icon,
            )
          : GestureDetector(
              onTap: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text!,
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
    );
  }
}
