import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/app_router.dart';

void main() {
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
