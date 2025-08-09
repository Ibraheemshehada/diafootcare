import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhatsNewCard extends StatelessWidget {
  final TimeOfDay nextReminder;
  final int weeklyProgressPercent;
  const WhatsNewCard({
    super.key,
    required this.nextReminder,
    required this.weeklyProgressPercent,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    // Outer container keeps the nice shadow + radius
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(blurRadius: 16, color: Colors.black12, offset: Offset(0, 8)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: LayoutBuilder(
          builder: (context, c) {
            final w = c.maxWidth;
            final h = c.maxHeight == double.infinity ? 140.h : c.maxHeight;

            return Container(
              // padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xff077FFF).withOpacity(.95), // keep brand blue bright
                    const Color(0xff077FFF),
                  ],
                ),
              ),
              child: Stack(
                children: [


                  // Top-right decorative SVG
                  Positioned(
                    top:0,             // slight overflow upward
                    right: 0,           // slight overflow to the right
                    child: SizedBox(
                      width: .48*w,          // ~48% of card width
                      height:.48* h,
                      child: SvgPicture.asset(
                        'assets/svg/whats_bg_top_right.svg',
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.01),
                          BlendMode.srcATop,
                        ),
                      ),
                    ),
                  ),

                  // Bottom-left decorative SVG
                  Positioned(
                    bottom: 0,          // slight overflow downward
                    left: 0,            // slight overflow to the left
                    child: SizedBox(
                      width: .8*w,
                      height: .6*h,
                      child: SvgPicture.asset(
                        'assets/svg/whats_bg_bottom_left.svg',
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomLeft,
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.01),
                          BlendMode.srcATop,
                        ),
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("What’s New Today?",
                            style: t.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            const Icon(Icons.alarm, color: Colors.white),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                "Next Reminder: Take a wound photo at ${nextReminder.format(context)}",
                                style: t.textTheme.bodyMedium?.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            const Icon(Icons.trending_up, color: Colors.white),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                "Last Week’s Progress: +$weeklyProgressPercent% improvement",
                                style: t.textTheme.bodyMedium?.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
