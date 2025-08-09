import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? emailError;
  String? firstNameError;
  String? lastNameError;
  String? passwordError;
  String? confirmPasswordError;

  bool isLoading = false;
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool validate() {
    emailError = null;
    firstNameError = null;
    lastNameError = null;
    passwordError = null;
    confirmPasswordError = null;

    if (emailController.text.isEmpty) emailError = 'email_required';
    if (firstNameController.text.isEmpty) firstNameError = 'first_name_required';
    if (lastNameController.text.isEmpty) lastNameError = 'last_name_required';
    if (passwordController.text.length < 6) passwordError = 'password_short';
    if (passwordController.text != confirmPasswordController.text) {
      confirmPasswordError = 'password_mismatch';
    }

    notifyListeners();
    return emailError == null &&
        firstNameError == null &&
        lastNameError == null &&
        passwordError == null &&
        confirmPasswordError == null;
  }

  Future<void> signUp(BuildContext context) async {
    if (!validate()) return;

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // simulate
    isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signed up successfully')),
    );

    Navigator.pop(context); // Go back to login
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
