import 'package:flutter/material.dart';
import 'package:tourister/Features/Splash/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingViewBody(),
      ),
    );
  }
}
