import 'package:flutter/material.dart';
import 'package:rawaan_vault/src/showcases/brew/brew_auth_screen.dart';
import 'package:rawaan_vault/src/showcases/brew/brew_name_screen.dart';
import 'package:rawaan_vault/src/showcases/brew/brew_otp_screen.dart';
import 'package:rawaan_vault/src/showcases/foodpanda/foodpanda_splash.dart';
import 'package:rawaan_vault/src/showcases/foodpanda/foodpanda_home.dart';
import 'package:rawaan_vault/src/showcases/foodpanda/foodpanda_restaurant_list.dart';
import 'package:rawaan_vault/src/showcases/foodpanda/foodpanda_menu.dart';
import 'package:rawaan_vault/src/showcases/foodpanda/foodpanda_cart.dart';
import 'package:rawaan_vault/src/showcases/foodpanda/foodpanda_search.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_cart_screen.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_welcome_screen.dart';
import 'package:rawaan_vault/src/showcases/maniro/maniro_home_screen.dart';
import 'package:rawaan_vault/src/showcases/maniro/maniro_welcome_screen.dart';
import 'package:rawaan_vault/src/templates/food/food.v1.dart';
import 'package:rawaan_vault/src/templates/food/food.v3.dart';
import 'package:rawaan_vault/src/templates/food/food.v4.dart';
import 'package:rawaan_vault/src/templates/subscription/subscription.v1.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v10.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v11.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v12.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v13.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v14.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v15.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v16.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v17.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v18.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v19.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v2.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v20.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v21.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v22.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v23.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v24.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v25.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v26.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v27.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v28.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v29.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v3.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v30.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v4.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v5.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v6.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v7.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v8.dart';
import 'package:rawaan_vault/src/templates/auth/auth.v9.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v1.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v10.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v2.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v3.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v4.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v5.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v6.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v7.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v8.dart';
import 'package:rawaan_vault/src/templates/cart/cart.v9.dart';
import 'package:rawaan_vault/src/templates/food/food.v2.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v1.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v10.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v11.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v2.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v3.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v4.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v5.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v6.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v7.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v8.dart';
import 'package:rawaan_vault/src/templates/onboarding/onboarding.v9.dart';
import 'package:rawaan_vault/src/templates/subscription/subscription.v2.dart';
import 'package:rawaan_vault/src/templates/subscription/subscription.v3.dart';
import 'package:rawaan_vault/src/templates/subscription/subscription.v4.dart';
import 'package:rawaan_vault/src/templates/subscription/subscription.v5.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v1.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v10.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v11.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v12.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v13.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v14.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v2.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v3.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v4.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v5.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v6.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v7.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v8.dart';
import 'package:rawaan_vault/src/templates/welcome/welcome.v9.dart';

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
      home: const FoodV4Screen(),
    );
  }
}

// DEBUG: Active widget count → 100
