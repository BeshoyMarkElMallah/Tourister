import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/assets.dart';
import 'package:tourister/core/utils/styles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            AssetsData.backgroundSplash,
            fit: BoxFit.fill,
          ),
        ),
        Opacity(
          opacity: 0.3,
          child: Container(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
              ),
              Text(
                'Welcome to',
                style: Styles.textStyle40.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ' Tourister',
                style: Styles.textStyle64.copyWith(color: kPrimaryColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Your best guide in Egypt to unlocking everything you need in a click of a button',
                style: Styles.textStyle18.copyWith(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kOnBoardingView);
    });
  }
}
