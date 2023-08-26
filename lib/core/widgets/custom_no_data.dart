import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tourister/core/utils/assets.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AssetsData.noData),
    );
  }
}
