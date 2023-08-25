import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourister/Features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/account_ask.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/custom_divider.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/social_icons_button.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/core/utils/assets.dart';
import 'package:tourister/core/utils/functions/show_snackBar.dart';
import 'package:tourister/core/utils/styles.dart';
import 'package:tourister/core/widgets/custom_loading_indicator.dart';

class SocialCollectionBody extends StatelessWidget {
  const SocialCollectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showSnackBar(context, state.error);
        } else if (state is AuthSignedInWithApple ||
            state is AuthSignedInWithFacebook ||
            state is AuthSignedInWithGoogle) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
      },
      builder: (context, state) {
        return state is AuthLoading
            ? const CustomLoadingIndicator()
            : SingleChildScrollView(
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
                        style: Styles.textStyle30
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SocialIconButton(
                        icon: Image.asset(AssetsData.facebook),
                        text: 'Continue with Facebook',
                        verpad: 16,
                        onPressed: () {
                          context.read<AuthCubit>().signInWithFacebook();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SocialIconButton(
                        icon: Image.asset(AssetsData.google),
                        text: 'Continue with Google',
                        verpad: 16,
                        onPressed: () {
                          context.read<AuthCubit>().signInWithGoogle();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SocialIconButton(
                        icon: Image.asset(AssetsData.apple),
                        text: 'Continue with Apple',
                        verpad: 15,
                        onPressed: () {
                          context.read<AuthCubit>().signInWithApple();
                        },
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
      },
    );
  }
}
