import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/Features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/account_ask.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/custom_divider.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/email_text_form_input.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/password_text_form_input.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/social_buttons_row.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/functions/alert_internet_dialog.dart';
import 'package:tourister/core/utils/functions/show_snackBar.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_button.dart';
import 'package:tourister/core/widgets/custom_loading_indicator.dart';

// ignore: must_be_immutable
class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  String? email, password;

  bool checkVal = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showSnackBar(context, state.error);
        } else if (state is AuthSignedUpWithEmail) {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        } else if (state is AuthSignedInWithApple ||
            state is AuthSignedInWithFacebook ||
            state is AuthSignedInWithGoogle) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is AuthConnectionFailure) {
          showInternetDialog(context, state.error);
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
                            'Create your Account',
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
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: 'Sign up',
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context)
                                  .signUpWithEmail(
                                      email: email!, password: password!);
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
                          facebookOnPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .signInWithFacebook();
                          },
                          googleOnPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .signInWithGoogle();
                          },
                          appleOnPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .signInWithApple();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AccountAsk(
                          text: 'Already have an account?',
                          sign: 'Sign in',
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kLoginView);
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
