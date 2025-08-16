import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../routes/app_routes.dart';
import '../../settings/screens/terms_screen.dart';
import '../../settings/viewmodel/settings_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _boot();
  }

  Future<void> _boot() async {
    // Parallel: show splash for ~2s and load prefs
    final settings = context.read<SettingsViewModel>();
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      settings.loadPrefs(),
    ]);

    if (!mounted) return;

    // Gate on terms acceptance
    if (!settings.acceptedTerms) {
      // Block until accepted, then continue
      final accepted = await Navigator.push<bool>(
        context,
        MaterialPageRoute(
          builder: (_) => const TermsScreen(blocking: true),
        ),
      );

      if (!mounted) return;

      if (accepted == true) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      } else {
        // If user backs out, you could close app or stay on splash.
        // Here we just stay.
      }
      return;
    }

    // Terms already accepted → proceed to login
    Navigator.pushReplacementNamed(context, AppRoutes.login);
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
            const Spacer(),
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
                  color: Colors.lightBlueAccent,
                ),
                children: [
                  TextSpan(
                    text: tr('app_name_dark'),
                    style: TextStyle(color: isDark ? Colors.blue : Colors.blue),
                  ),
                ],
              ),
            ),

            const Spacer(),
            LoadingAnimationWidget.hexagonDots(
              color: const Color(0xff077FFF),
              size: 45.w,
            ),
            SizedBox(height: 36.h),
          ],
        ),
      ),
    );
  }
}
