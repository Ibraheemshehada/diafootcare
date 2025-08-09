
import 'package:diafoot_care/features/auth/screens/splash_screen.dart';
import 'package:diafoot_care/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/auth/screens/confirm_code_screen.dart';
import 'features/auth/screens/otp_verify_screen.dart';
import 'features/auth/screens/reset_success_screen.dart';
import 'features/auth/screens/set_new_password_screen.dart';
import 'features/auth/viewmodel/forget_password_viewmodel.dart';
import 'features/shell/controllers/shell_controller.dart';

class DiaFootApp extends StatelessWidget {
  const DiaFootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (_) => ShellController(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: tr('app_name'),
            theme: lightTheme,
            darkTheme: darkTheme,
           // themeMode: ThemeMode.system,
            themeMode: ThemeMode.light,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: AppRoutes.mainShell, // or splash
            routes: AppRoutes.routes,
              onGenerateRoute: (settings) {
                if (settings.name == AppRoutes.confirm) {
                  final email = settings.arguments as String;
                  final maskedEmail = ForgetPasswordViewModel().maskEmail(email);
                  return MaterialPageRoute(
                    builder: (_) => ConfirmCodeScreen(maskedEmail: maskedEmail),
                  );
                }
          
                if (settings.name == AppRoutes.otp) {
                  final maskedEmail = settings.arguments as String;
                  return MaterialPageRoute(
                    builder: (_) => OtpVerifyScreen(maskedEmail: maskedEmail),
                  );
                }
                if (settings.name == AppRoutes.resetSuccess) {
                  return MaterialPageRoute(
                    builder: (_) => const ResetSuccessScreen(),
                  );
                }
                if (settings.name == AppRoutes.setPassword) {
                  return MaterialPageRoute(
                    builder: (_) => const SetNewPasswordScreen(),
                  );
                }
          
                return null;
              }
          ),
        );
      },
    );
  }
}