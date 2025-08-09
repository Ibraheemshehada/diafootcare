import 'package:diafoot_care/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  String? emailError;
  bool isLoading = false;

  bool validateEmail() {
    emailError = null;

    if (emailController.text.isEmpty) {
      emailError = 'email_required';
    } else if (!emailController.text.contains('@')) {
      emailError = 'email_invalid';
    }

    notifyListeners();
    return emailError == null;
  }

  Future<void> resetPassword(BuildContext context) async {
    if (!validateEmail()) return ;

    isLoading = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      Navigator.pushNamed(
        context,
        AppRoutes.confirm, // Make sure it's defined in app_routes.dart
        arguments: emailController.text.trim(), // optional
      );

    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('reset_email_failed').tr()),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final name = parts[0];
    final masked = name.length <= 2
        ? '${name[0]}***'
        : '${name[0]}${'*' * (name.length - 2)}${name[name.length - 1]}';
    return '$masked@${parts[1]}';
  }
}
