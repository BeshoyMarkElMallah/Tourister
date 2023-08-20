import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/account_ask.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/custom_divider.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/email_text_form_input.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/password_text_form_input.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/social_buttons_row.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool checkVal = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 80,
              ),
              child: Text(
                'Log in your Account',
                style: Styles.textStyle38.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            EmailTextFormInput(emailController: emailController),
            const SizedBox(
              height: 26,
            ),
            PasswordTextFormInput(passController: passController),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    activeColor: kSecondaryColor,
                    splashRadius: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    value: checkVal,
                    onChanged: (value) {
                      setState(() {
                        checkVal = value!;
                      });
                    }),
                const Text('Remember me')
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Sign in',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kHomeView);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomDivider(text: 'or continue with'),
            const SizedBox(
              height: 30,
            ),
            SocialButtonsRow(
              facebookOnPressed: () {},
              googleOnPressed: () {},
              appleOnPressed: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            AccountAsk(
              text: 'Don\'t have an account?',
              sign: 'Sign up',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kRegisterView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
