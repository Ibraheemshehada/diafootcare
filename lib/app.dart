import 'package:diafoot_care/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'core/services/auth_services.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/auth/screens/confirm_code_screen.dart';
import 'features/auth/screens/otp_verify_screen.dart';
import 'features/auth/screens/reset_success_screen.dart';
import 'features/auth/screens/set_new_password_screen.dart';
import 'features/auth/viewmodel/forget_password_viewmodel.dart';
import 'features/home/screens/home_screen.dart';
import 'features/notes/viewmodel/notes_viewmodel.dart';
import 'features/profile/viewmodel/profile_viewmodel.dart';
import 'features/settings/viewmodel/settings_viewmodel.dart';
import 'features/shell/controllers/shell_controller.dart';
import 'features/reminders/viewmodel/reminders_viewmodel.dart';

import 'features/auth/screens/login_screen.dart'; // Assuming you have a login screen
// Assuming you have a home screen

class DiaFootApp extends StatelessWidget {
  const DiaFootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ShellController()),
            ChangeNotifierProvider(create: (_) => RemindersViewModel()),
            ChangeNotifierProvider(create: (_) => NotesViewModel()),
            ChangeNotifierProvider(create: (_) => SettingsViewModel()),
            ChangeNotifierProvider(create: (_) => ProfileViewModel()),
          ],
          child: Builder(
            builder: (inner) {
              final themeMode = inner.watch<SettingsViewModel>().themeMode;
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: tr('app_name'),
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                localizationsDelegates: inner.localizationDelegates,
                supportedLocales: inner.supportedLocales,
                locale: inner.locale,

                initialRoute: AppRoutes.splash,
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
                },
              );
            },
          ),
        );
      },
    );
  }
}

class AuthStreamBuilder extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authService.authStateChanges, // Listening to auth state changes
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomeScreen(); // Signed-in user, navigate to HomeScreen
          } else {
            return LoginScreen(); // No user signed in, show LoginScreen
          }
        } else {
          return Center(child: CircularProgressIndicator()); // Loading state
        }
      },
    );
  }
}
