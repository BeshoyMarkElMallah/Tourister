import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/account_ask.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/custom_divider.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/social_icons_button.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/assets.dart';
import 'package:tourister/core/utils/styles.dart';

class SocialCollectionBody extends StatelessWidget {
  const SocialCollectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 36,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              alignment: Alignment.center,
              child: Image.asset(AssetsData.socialCollection),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Start by Signing in',
              style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            SocialIconButton(
              icon: Image.asset(AssetsData.facebook),
              text: 'Continue with Facebook',
              verpad: 16,
            ),
            const SizedBox(
              height: 30,
            ),
            SocialIconButton(
              icon: Image.asset(AssetsData.google),
              text: 'Continue with Google',
              verpad: 16,
            ),
            const SizedBox(
              height: 30,
            ),
            SocialIconButton(
              icon: Image.asset(AssetsData.apple),
              text: 'Continue with Apple',
              verpad: 15,
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomDivider(text: 'or'),
            const SizedBox(
              height: 15,
            ),
            AccountAsk(
              text: 'Don\'t have an account?',
              sign: 'Sign up',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kRegisterView);
              },
            )
          ],
        ),
      ),
    );
  }
}
