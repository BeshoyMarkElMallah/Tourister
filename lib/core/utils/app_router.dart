import 'package:go_router/go_router.dart';
import 'package:tourister/Features/Auth/presentation/views/login_view.dart';
import 'package:tourister/Features/Auth/presentation/views/register_view.dart';
import 'package:tourister/Features/Auth/presentation/views/social_collection_view.dart';
import 'package:tourister/Features/Splash/presentation/views/on_boarding_view.dart';
import 'package:tourister/Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kOnBoardingView = '/onBoardingView';
  static const kSocialCollectionView = '/socialCollectionView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kSocialCollectionView,
        builder: (context, state) => const SocialCollectionView(),
      ),
    ],
  );
}
