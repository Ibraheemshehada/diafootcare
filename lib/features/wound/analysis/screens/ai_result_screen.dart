// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
//
// /// You can pass parsed AI values here later.
// /// For now we keep the XFile (photo) just in case you want to show it somewhere.
// class AiResultScreen extends StatelessWidget {
//   final XFile file;
//   const AiResultScreen({super.key, required this.file});
//
//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context);
//     final primary = t.colorScheme.primary;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AI Wound Analysis', style: TextStyle(fontSize: 18.sp)),
//       ),
//       body: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
//           children: [
//             _SectionTitle('Measurements'),
//             SizedBox(height: 12.h),
//
//             _StatCard(
//               icon: Icons.straighten, // length icon
//               value: '8.1',
//               unit: 'cm',
//               label: 'Length',
//               color: primary,
//             ),
//             SizedBox(height: 10.h),
//             _StatCard(
//               icon: Icons.straighten_rounded,
//               value: '5.0',
//               unit: 'cm',
//               label: 'Width',
//               color: primary,
//             ),
//             SizedBox(height: 10.h),
//             _StatCard(
//               icon: Icons.straighten, // reuse
//               value: '3.2',
//               unit: 'cm',
//               label: 'Depth',
//               color: primary,
//             ),
//
//             SizedBox(height: 20.h),
//             _SectionTitle('Wound Details'),
//             SizedBox(height: 12.h),
//
//             _DetailCard(
//               icon: Icons.auto_awesome, // granulation
//               title: 'Granulation',
//               subtitle: 'Tissue Type',
//               color: primary,
//             ),
//             SizedBox(height: 10.h),
//             _DetailCard(
//               icon: Icons.opacity_outlined,
//               title: 'Moderate',
//               subtitle: 'Pus Level',
//               color: primary,
//             ),
//             SizedBox(height: 10.h),
//             _DetailCard(
//               icon: Icons.local_fire_department_outlined,
//               title: 'None',
//               subtitle: 'Inflammation',
//               color: primary,
//             ),
//
//             SizedBox(height: 20.h),
//             _SectionTitle('Progress Summary'),
//             SizedBox(height: 12.h),
//
//             _DetailCard(
//               icon: Icons.trending_up_rounded,
//               title: '+12% since last week',
//               subtitle: 'Healing Progress',
//               color: primary,
//             ),
//
//             SizedBox(height: 20.h),
//             _SectionTitle('Progress Graph'),
//             SizedBox(height: 12.h),
//
//             // Graph container (use your actual chart later; image placeholder for now)
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12.r),
//               child: AspectRatio(
//                 aspectRatio: 16 / 10,
//                 child: Container(
//                   color: t.colorScheme.surfaceVariant.withOpacity(.3),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: EdgeInsets.all(8.w),
//                     child: Image.asset(
//                       'assets/images/progress_graph.png', // <- add this in pubspec
//                       fit: BoxFit.contain,
//                       errorBuilder: (_, __, ___) => Text(
//                         'Graph Placeholder',
//                         style: t.textTheme.bodyMedium,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 28.h),
//             SizedBox(
//               height: 52.h,
//               child: FilledButton(
//                 onPressed: () {
//                   // TODO: persist result to DB
//                   Navigator.popUntil(context, (r) => r.isFirst);
//                 },
//                 child: Text('Save Result', style: TextStyle(fontSize: 16.sp)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _SectionTitle extends StatelessWidget {
//   final String text;
//   const _SectionTitle(this.text);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//         fontSize: 20.sp,
//         fontWeight: FontWeight.w700,
//       ),
//     );
//   }
// }
//
// class _StatCard extends StatelessWidget {
//   final IconData icon;
//   final String value;
//   final String unit;
//   final String label;
//   final Color color;
//
//   const _StatCard({
//     required this.icon,
//     required this.value,
//     required this.unit,
//     required this.label,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context);
//     return Container(
//       padding: EdgeInsets.all(14.w),
//       decoration: BoxDecoration(
//         color: t.cardColor,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(color: t.colorScheme.outlineVariant.withOpacity(.35)),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40.w,
//             height: 40.w,
//             decoration: BoxDecoration(
//               color: color.withOpacity(.08),
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Icon(icon, size: 22.sp, color: color),
//           ),
//           SizedBox(width: 12.w),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               RichText(
//                 text: TextSpan(
//                   style: t.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp),
//                   children: [
//                     TextSpan(text: value),
//                     TextSpan(text: ' $unit', style: TextStyle(fontWeight: FontWeight.w600)),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 2.h),
//               Text(label, style: t.textTheme.bodySmall?.copyWith(color: t.colorScheme.onSurfaceVariant, fontSize: 12.sp)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _DetailCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   final Color color;
//
//   const _DetailCard({
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context);
//     return Container(
//       padding: EdgeInsets.all(14.w),
//       decoration: BoxDecoration(
//         color: t.cardColor,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(color: t.colorScheme.outlineVariant.withOpacity(.35)),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40.w,
//             height: 40.w,
//             decoration: BoxDecoration(
//               color: color.withOpacity(.08),
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Icon(icon, size: 22.sp, color: color),
//           ),
//           SizedBox(width: 12.w),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: t.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp)),
//               SizedBox(height: 2.h),
//               Text(subtitle, style: t.textTheme.bodySmall?.copyWith(color: t.colorScheme.onSurfaceVariant, fontSize: 12.sp)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:diafoot_care/features/wound/analysis/viewmodel/analysis_result.dart';
import 'package:flutter_svg/svg.dart';

class AiResultScreen extends StatelessWidget {
  final AnalysisResult result;
  const AiResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final primary = t.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text('AI Wound Analysis', style: TextStyle(fontSize: 18.sp)),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
          children: [
            _SectionTitle('Measurements'),
            SizedBox(height: 12.h),

            _StatCard(
              icon: Icons.straighten,
              value: result.length,
              label: 'Length',
              color: primary,
              quarterTurns: 1, // 90° clockwise; 3 for counter-clockwise
            ),

            SizedBox(height: 10.h),
            _StatCard(icon: Icons.straighten, value: result.width, label: 'Width', color: primary),
            SizedBox(height: 10.h),
            _StatCard(svgAsset: 'assets/svg/arrow_down.svg', value: result.depth, label: 'Depth', color: primary),

            SizedBox(height: 20.h),
            _SectionTitle('Wound Details'),
            SizedBox(height: 12.h),

            _DetailCard(svgAsset: 'assets/svg/micro.svg', title: result.tissueType, subtitle: 'Tissue Type', color: primary),
            SizedBox(height: 10.h),
            _DetailCard(icon: Icons.opacity_outlined, title: result.pusLevel, subtitle: 'Pus Level', color: primary),
            SizedBox(height: 10.h),
            _DetailCard(icon: Icons.local_fire_department_outlined, title: result.inflammation, subtitle: 'Inflammation', color: primary),

            SizedBox(height: 20.h),
            _SectionTitle('Progress Summary'),
            SizedBox(height: 12.h),

            _DetailCard(
              icon: Icons.trending_up_rounded,
              title: '+${result.healingProgress}% since last week',
              subtitle: 'Healing Progress',
              color: primary,
            ),

            SizedBox(height: 20.h),
            _SectionTitle('Progress Graph'),
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(result.graphImagePath, fit: BoxFit.contain),
            ),

            SizedBox(height: 28.h),
            SizedBox(
              height: 52.h,
              child: FilledButton(
                onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                child: Text('Save Result', style: TextStyle(fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- UI helper widgets (unchanged from before) ---
class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
  );
}
class _StatCard extends StatelessWidget {
  // One of these must be provided
  final IconData? icon;
  final String? svgAsset;

  final double value;
  final String label;
  final Color color;

  // Rotate the icon/SVG by 90° steps (0,1,2,3)
  final int quarterTurns;

  // Optional unit suffix (defaults to "cm")
  final String unit;

  const _StatCard({
    this.icon,
    this.svgAsset,
    required this.value,
    required this.label,
    required this.color,
    this.quarterTurns = 0,
    this.unit = 'cm',
    super.key,
  }) : assert(icon != null || svgAsset != null,
  'Provide either icon or svgAsset');

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    Widget leading;
    if (svgAsset != null) {
      leading = SvgPicture.asset(
        svgAsset!,
        width: 22.w,
        height: 22.w,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    } else {
      leading = Icon(icon, size: 22.sp, color: color);
    }

    // Apply 90° rotation if needed
    leading = RotatedBox(quarterTurns: quarterTurns, child: leading);

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: t.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: t.colorScheme.outlineVariant.withOpacity(.35)),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: color.withOpacity(.08),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(child: leading),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${"${value.toStringAsFixed(1)} ${unit.isEmpty ? "" : unit}"}',
                style: t.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                label,
                style: t.textTheme.bodySmall?.copyWith(
                  color: t.colorScheme.onSurfaceVariant,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




class _DetailCard extends StatelessWidget {
  final IconData? icon;       // optional if svgAsset is used
  final String? svgAsset;     // optional if icon is used
  final String title;
  final String subtitle;
  final Color color;

  const _DetailCard({
    this.icon,
    this.svgAsset,
    required this.title,
    required this.subtitle,
    required this.color,
    super.key,
  }) : assert(
  icon != null || svgAsset != null,
  'You must provide either icon or svgAsset',
  );

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: t.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: t.colorScheme.outlineVariant.withOpacity(.35)),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: color.withOpacity(.08),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: svgAsset != null
                  ? SvgPicture.asset(
                svgAsset!,
                width: 22.w,
                height: 22.w,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              )
                  : Icon(
                icon,
                size: 22.sp,
                color: color,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: t.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: t.textTheme.bodySmall?.copyWith(
                  color: t.colorScheme.onSurfaceVariant,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

