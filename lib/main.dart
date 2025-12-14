import 'package:flutter/material.dart';
import 'package:rawaan_vault/presentation/premium/loza/loza_cart_screen.dart';
import 'package:rawaan_vault/presentation/premium/loza/loza_welcome_screen.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_home_screen.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_welcome_screen.dart';
import 'package:rawaan_vault/presentation/templates/food/food.v2.dart';

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
      home: const ManiroWelcomeScreen(),
    );
  }
}

// DEBUG: Active widget count → 46
