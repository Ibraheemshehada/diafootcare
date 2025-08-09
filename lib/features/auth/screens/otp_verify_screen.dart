import 'package:diafoot_care/features/auth/viewmodel/otp_verify_viewmodel.dart';
import 'package:diafoot_care/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class OtpVerifyScreen extends StatelessWidget {
  final String maskedEmail;
  const OtpVerifyScreen({super.key, required this.maskedEmail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => OtpVerifyViewModel(),
      child: Consumer<OtpVerifyViewModel>(
        builder: (context, vm, _) => Scaffold(
          appBar: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Text(
                  tr('otp_title'), // "Check your email"
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Text(
                  '${tr('otp_subtitle')} $maskedEmail',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${tr('otp_subtitle2')}',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return SizedBox(
                      width: 40.w,
                      height: 75.h,
                      child: TextField(
                        controller: vm.controllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: const InputDecoration(counterText: ''),
                        onChanged: (value) => vm.onOtpChange(index, value, context),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                  //  onPressed: vm.isLoading ? null : () => vm.verifyCode(context),
                    onPressed: vm.isLoading ? null : () {
                      Navigator.pushNamed(context, AppRoutes.resetSuccess);
                    },
                    child: vm.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(tr('verify_code')),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () => vm.resendEmail(context),
                  child: RichText(
                    text: TextSpan(
                      text: tr('email_not_received') + ' ',
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: tr('resend_email'),
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
