import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/app_router.dart';
import 'package:tourister/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TouristerApp());
}

class TouristerApp extends StatelessWidget {
  const TouristerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primaryColor: kSecondaryColor,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: kSecondaryColor))),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
