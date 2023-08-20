import 'package:flutter/material.dart';
import 'package:tourister/Features/Splash/data/static/static.dart';
import 'package:tourister/core/utils/styles.dart';

List<Widget> getDataFromModel(
    {required bool isImg, required BuildContext context}) {
  List<Widget> list = [];
  for (var element in onBoardingList) {
    if (isImg) {
      list.add(
        Image.asset(element.image),
      );
    } else {
      list.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Text(
                element.description,
                style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }
  }
  return list;
}
