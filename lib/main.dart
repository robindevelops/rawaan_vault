import 'package:flutter/material.dart';
import 'package:rawaan_vault/src/showcases/brew/brew_auth_screen.dart';
import 'package:rawaan_vault/src/showcases/foodpanda/foodpanda_splash.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_login_screen.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_onboarding_screen.dart';
import 'package:rawaan_vault/src/showcases/maniro/maniro_onboarding_screen.dart';
import 'package:rawaan_vault/src/templates/food/food.v4.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v15.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v16.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v17.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v18.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v19.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v20.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeV20Screen(),
    );
  }
}

// DEBUG: Active widget count → 100
