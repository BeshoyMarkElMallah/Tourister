import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/styles.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({
    super.key,
    required this.isSelected,
    required this.img,
    required this.title,
  });
  final bool isSelected;
  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.only(right: 10),
      height: MediaQuery.of(context).size.height * .07,
      decoration: isSelected == true
          ? BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 2),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected == true
              ? CircleAvatar(
                  backgroundColor: kSecondaryColor,
                  radius: 25,
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                )
              : CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                    color: kSecondaryColor,
                  ),
                ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
