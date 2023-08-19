import 'package:flutter/widgets.dart';
import 'package:tourister/Features/Splash/presentation/views/widgets/custom_slider_onboarding.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: CustomSliderOnBoarding(),
        ),
      ],
    );
  }
}
