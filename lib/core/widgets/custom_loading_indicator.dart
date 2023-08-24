import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tourister/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [kSecondaryColor],
          strokeWidth: 1,
        ),
      ),
    );
  }
}
