import 'package:flutter/material.dart';
import 'package:rawaan_vault/presentation/templates/food/food.v1.dart';

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
      home: FoodV1Screen(),
    );
  }
}

// DEBUG: Active widget count → 46
