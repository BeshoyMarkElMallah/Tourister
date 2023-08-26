import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/core/utils/styles.dart';

class CustomSiteDetailsAppBar extends StatelessWidget {
  const CustomSiteDetailsAppBar({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        Spacer(),
        Text(
          category,
          style: Styles.textStyle18,
        ),
        Spacer()
      ],
    );
  }
}
