import 'package:flutter/material.dart';

import 'package:diafoot_care/features/auth/screens/forget_password_screen.dart';
import 'package:diafoot_care/features/auth/screens/reset_success_screen.dart';
import 'package:diafoot_care/features/auth/screens/login_screen.dart';
import 'package:diafoot_care/features/auth/screens/signup_screen.dart';
import 'package:diafoot_care/features/auth/screens/splash_screen.dart';

import 'package:diafoot_care/features/shell/screens/main_shell.dart'; // NEW import for shell

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const confirm = '/confirm';
  static const String otp = '/otp-verify';
  static const String resetSuccess = '/reset-success';
  static const String setPassword = '/set-password';
  static const String signup = '/signup';

  // Shell route
  static const String mainShell = '/'; // Default home route → shell

  // You can still keep named routes for subpages if needed
  static const String capture = '/capture';
  static const String measure = '/measure';
  static const String reminders = '/reminders';
  static const String notes = '/notes';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    signup: (_) => const SignUpScreen(),
    forgetPassword: (_) => const ForgetPasswordScreen(),
    resetSuccess: (_) => const ResetSuccessScreen(),

    // The shell replaces direct HomeScreen usage
    mainShell: (_) => const MainShell(),
  };
}
