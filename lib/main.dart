import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourister/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:tourister/Features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:tourister/Features/home/presentation/manager/cubits/pages_data_cubit/pages_data_cubit.dart';
import 'package:tourister/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/firebase_options.dart';
import 'package:tourister/mu_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  runApp(const TouristerApp());
}

class TouristerApp extends StatelessWidget {
  const TouristerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => PagesDataCubit(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            primaryColor: kSecondaryColor,
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: kSecondaryColor))),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
