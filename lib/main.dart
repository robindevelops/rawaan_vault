import 'package:flutter/material.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v1.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v2.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v3.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v4.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v5.dart';
import 'package:rawaan_vault/presentation/templates/finance/finance.v1.dart';
import 'package:rawaan_vault/presentation/templates/government/government.v1.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v1.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v2.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v3.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v4.dart';
import 'package:rawaan_vault/presentation/templates/onboarding/onboarding.v5.dart';
import 'package:rawaan_vault/presentation/templates/uber/uber.v1.dart';
import 'package:rawaan_vault/presentation/templates/uber/uber.v2.dart';
import 'package:rawaan_vault/presentation/templates/uber/uber.v3.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v1.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v10.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v11.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v2.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v3.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v4.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v5.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v6.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v7.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v8.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v9.dart';

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
      home: UberV1Screen(),
    );
  }
}
