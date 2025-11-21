import 'package:flutter/material.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v3.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingV4Screen(),
    );
  }
}
