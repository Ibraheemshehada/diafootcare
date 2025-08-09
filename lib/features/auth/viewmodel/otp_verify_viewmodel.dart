import 'package:flutter/material.dart';

class OtpVerifyViewModel extends ChangeNotifier {
  List<TextEditingController> controllers = List.generate(5, (_) => TextEditingController());
  bool isLoading = false;

  void onOtpChange(int index, String value, BuildContext context) {
    if (value.isNotEmpty && index < 4) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  Future<void> verifyCode(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final otp = controllers.map((c) => c.text).join();
    if (otp.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter 5 digits')),
      );
      isLoading = false;
      notifyListeners();
      return;
    }

    // TODO: Implement verification logic here
    debugPrint("Entered OTP: $otp");

    isLoading = false;
    notifyListeners();

    // After successful verification:
    Navigator.pushReplacementNamed(context, '/login'); // or home
  }

  Future<void> resendEmail(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Resend email logic here...')),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
