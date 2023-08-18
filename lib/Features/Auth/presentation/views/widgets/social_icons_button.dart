import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: IconButton(
        splashRadius: 30,
        splashColor: kSecondaryColor,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
