import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../home/screens/home_screen.dart';
import '../../history/screens/wound_history_screen.dart';

import '../../profile/screens/profile_screen.dart';
import '../../wound/capture/screens/capture_screen.dart';
import '../controllers/shell_controller.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final pages = const [
      HomeScreen(),
      WoundHistoryScreen(),
      CaptureScreen(),
      ProfileScreen(),
    ];

    return Consumer<ShellController>(
      builder: (context, shell, _) {
        return WillPopScope(
          onWillPop: () async {
            if (shell.index != 0) { shell.setIndex(0); return false; }
            return true;
          },
          child: Scaffold(
            body: SafeArea(
              top: true,
              bottom: false,
              child: IndexedStack(index: shell.index, children: pages),
            ),
            bottomNavigationBar: SafeArea(
              top: false,
              child: Container(
                decoration: BoxDecoration(
                  color: t.scaffoldBackgroundColor,
             //     boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12, offset: Offset(0, -2))],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: BottomNavigationBar(
                    currentIndex: shell.index,
                    onTap: shell.setIndex,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    selectedItemColor: t.colorScheme.primary,
                    unselectedItemColor: t.colorScheme.onSurface.withOpacity(.6),
                    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                    unselectedLabelStyle: TextStyle(fontSize: 12.sp),
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.home_outlined),         activeIcon: Icon(Icons.home_rounded),           label: 'Home'),
                      BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined),     activeIcon: Icon(Icons.schedule_rounded),       label: 'Wound History'),
                      BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_outlined), activeIcon: Icon(Icons.qr_code_scanner),    label: 'Capture'),
                      BottomNavigationBarItem(icon: Icon(Icons.person_outline),        activeIcon: Icon(Icons.person),                  label: 'Profile'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
