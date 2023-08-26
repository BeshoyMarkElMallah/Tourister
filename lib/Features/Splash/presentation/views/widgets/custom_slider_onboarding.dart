import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/Features/Splash/data/static/static.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/functions/get_data_from_onBoarding_model.dart';
import 'package:tourister/core/utils/styles.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      totalPage: onBoardingList.length,
      headerBackgroundColor: const Color(0xfffafafa),
      background: getDataFromModel(isImg: true, context: context),
      speed: 2,
      pageBodies: getDataFromModel(isImg: false, context: context),
      centerBackground: true,
      hasFloatingButton: true,
      indicatorAbove: true,
      indicatorPosition: MediaQuery.of(context).size.height * 0.13,
      controllerColor: kSecondaryColor,
      addButton: true,
      addController: true,
      finishButtonStyle: const FinishButtonStyle(
          backgroundColor: kSecondaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)))),
      finishButtonText: 'Get Started',
      finishButtonTextStyle: Styles.textStyle20
          .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
      onFinish: () {
        GoRouter.of(context).push(AppRouter.kSocialCollectionView);
      },
    );
  }
}
