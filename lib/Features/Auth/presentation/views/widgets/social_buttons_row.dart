import 'package:flutter/material.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/social_icons_button.dart';
import 'package:tourister/core/utils/assets.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({
    super.key,
    this.facebookOnPressed,
    this.googleOnPressed,
    this.appleOnPressed,
  });
  final void Function()? facebookOnPressed;
  final void Function()? googleOnPressed;
  final void Function()? appleOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialIconButton(
          icon: Image.asset(AssetsData.facebook),
          onPressed: facebookOnPressed,
        ),
        SocialIconButton(
          icon: Image.asset(AssetsData.google),
          onPressed: googleOnPressed,
        ),
        SocialIconButton(
          icon: Image.asset(AssetsData.apple),
          onPressed: appleOnPressed,
        ),
      ],
    );
  }
}
