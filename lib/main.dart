import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      saveLocale: true,          // ✅ persist choice
      useOnlyLangCode: true,     // ✅ use 'en' / 'ar' file names
      child: const DiaFootApp(),
    ),
  );
}