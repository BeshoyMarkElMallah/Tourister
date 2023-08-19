import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/styles.dart';

class SearchSettingsRow extends StatelessWidget {
  const SearchSettingsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.73,
          child: TextField(
            cursorColor: kSecondaryColor,
            decoration: InputDecoration(
              focusColor: kSecondaryColor,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: kSecondaryColor)),
              hintText: 'Search',
              hintStyle: Styles.textStyle14
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: kSecondaryColor)),
            ),
          ),
        ),
        const Spacer(),
        MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          color: kSecondaryColor,
          minWidth: MediaQuery.of(context).size.width * 0.01,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.tune,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
