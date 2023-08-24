import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/Features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/account_ask.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/custom_divider.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/email_text_form_input.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/password_text_form_input.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/social_buttons_row.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/functions/show_snackBar.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_button.dart';
import 'package:tourister/core/widgets/custom_loading_indicator.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool checkVal = false;
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showSnackBar(context, state.error);
        } else if (state is AuthSignedInWithEmail) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        }
      },
      builder: (context, state) {
        return state is AuthLoading
            ? const CustomLoadingIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formkey,
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
                            style: Styles.textStyle38
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 49,
                        ),
                        EmailTextFormInput(
                          onChanged: (data) {
                            email = data;
                          },
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        PasswordTextFormInput(
                          onChanged: (data) {
                            password = data;
                          },
                        ),
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
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context)
                                  .signInwithEmail(email!, password!);
                            }
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
                ),
              );
      },
    );
  }
}
