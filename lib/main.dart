import 'package:flutter/material.dart';
import 'package:rawaan_vault/presentation/templates/crypto/crypto.v5.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v1.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v10.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v11.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v12.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v2.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v3.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v4.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v5.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v6.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v7.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v8.dart';
import 'package:rawaan_vault/presentation/templates/settings/setting.v9.dart';

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
      home: SettingV9Screen(),
    );
  }
}

// DEBUG: Active widget count → 46
