
import 'package:diafoot_care/features/auth/screens/splash_screen.dart';
import 'package:diafoot_care/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class DiaFootApp extends StatelessWidget {
  const DiaFootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: tr('app_name'),
          theme: lightTheme,
          darkTheme: darkTheme,
         // themeMode: ThemeMode.system,
          themeMode: ThemeMode.light,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: AppRoutes.splash, // or splash
          routes: AppRoutes.routes,
        );
      },
    );
  }
}