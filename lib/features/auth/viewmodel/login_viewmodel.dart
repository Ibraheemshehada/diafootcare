import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  bool isLoading = false;
  bool rememberMe = false;
  bool isPasswordVisible = false;
  bool validateForm() {
    emailError = null;
    passwordError = null;

    if (emailController.text.isEmpty) {
      emailError = 'email_required';
    } else if (!emailController.text.contains('@')) {
      emailError = 'email_invalid';
    }

    if (passwordController.text.length < 6) {
      passwordError = 'password_short';
    }

    notifyListeners();
    return emailError == null && passwordError == null;
  }

  Future<void> loginUser(BuildContext context) async {
    if (!validateForm()) return;

    isLoading = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // TODO: Navigate to HomeScreen
    } on FirebaseAuthException catch (e) {
      // TODO: Show dialog/snackbar
      debugPrint(e.message);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  void toggleRememberMe(bool? value) {
    rememberMe = value ?? false;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
