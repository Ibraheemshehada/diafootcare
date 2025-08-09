  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:provider/provider.dart';
  import '../viewmodel/home_viewmodel.dart';
  import '../widgets/home_header.dart';
  import '../widgets/whats_new_card.dart';
  import '../widgets/recent_note_card.dart';
  import '../widgets/service_tile.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, vm, _) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      HomeHeader(
                        userFirstName: vm.userFirstName,
                        onNotifications: () {}, // TODO: open notifications
                      ),

                      // What's new
                      WhatsNewCard(
                        nextReminder: vm.nextReminder,
                        weeklyProgressPercent: vm.weeklyProgressPercent,
                      ),

                      // Recent notes section title
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                        child: Text("Recent Notes", style: Theme.of(context).textTheme.titleMedium),
                      ),

                      // Recent notes horizontal list
                      SizedBox(
                        height: 160.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 16.w),
                          itemCount: vm.recentNotes.length,
                          itemBuilder: (context, i) {
                            final colors = [const Color(0xFFFFF1E6), const Color(0xFFFCE8F4)];
                            return RecentNoteCard(note: vm.recentNotes[i], color: colors[i % colors.length]);
                          },
                        ),
                      ),

                      // Services title
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                        child: Text("Services", style: Theme.of(context).textTheme.titleMedium),
                      ),

                      // Services grid (2x2)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: vm.services.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, i) {
                            final s = vm.services[i];
                            return ServiceTile(
                              item: s,
                              onTap: () => Navigator.pushNamed(context, s.route),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
              // Bottom nav bar would live in your app scaffold; omitted here to match your routing.
            );
          },
        ),
      );
    }
  }
