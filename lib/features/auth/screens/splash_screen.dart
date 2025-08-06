import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // ✅ Delay 2 seconds then navigate to Login
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(
              'assets/svg/logo_light.svg',
              height: 160.h,
              width: 160.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h),

            // Localized App Name using RichText
            RichText(
              text: TextSpan(
                text: tr('app_name_light'),
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      isDark ? Colors.lightBlueAccent : Colors.lightBlueAccent,
                ),
                children: [
                  TextSpan(
                    text: tr('app_name_dark'),
                    style: TextStyle(color: isDark ? Colors.blue : Colors.blue),
                  ),
                ],
              ),
            ),

            Spacer(),
            LoadingAnimationWidget.hexagonDots(
              color: theme.primaryColor,
              size: 45.w,
            ),

            // Loader
            // CircularProgressIndicator(
            //   color: theme.primaryColor,
            //   strokeWidth: 3,
            // ),
            SizedBox(height: 36.h),
          ],
        ),
      ),
    );
  }
}
