import 'package:flutter/material.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v1.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v2.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v3.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v4.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v5.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v1.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v2.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v3.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v4.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v5.dart';

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
      home: AuthV3Screen(),
    );
  }
}
