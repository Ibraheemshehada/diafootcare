import 'package:flutter/material.dart';

class SetPasswordViewModel extends ChangeNotifier {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? newPasswordError;
  String? confirmPasswordError;

  bool isLoading = false;
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool validateForm() {
    newPasswordError = null;
    confirmPasswordError = null;

    if (newPasswordController.text.length < 6) {
      newPasswordError = 'password_short';
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      confirmPasswordError = 'password_mismatch';
    }

    notifyListeners();
    return newPasswordError == null && confirmPasswordError == null;
  }

  Future<void> updatePassword(BuildContext context) async {
    if (!validateForm()) return;

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // Simulated

    isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password updated successfully')),
    );

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
