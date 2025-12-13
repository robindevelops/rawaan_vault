import 'package:flutter/material.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v1.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v10.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v11.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v12.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v13.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v14.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v15.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v16.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v17.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v18.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v19.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v2.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v20.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v21.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v22.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v23.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v24.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v25.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v26.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v27.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v28.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v5.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v6.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v7.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v8.dart';
import 'package:rawaan_vault/presentation/templates/auth/auth.v9.dart';
import 'package:rawaan_vault/presentation/templates/crypto/crypto.v1.dart';
import 'package:rawaan_vault/presentation/templates/welcome/welcome.v12.dart';

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
      home: AuthV28Screen(),
    );
  }
}

// DEBUG: Active widget count → 46
