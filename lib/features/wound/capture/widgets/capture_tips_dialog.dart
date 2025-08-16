import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaptureTipsDialog extends StatelessWidget {
  const CaptureTipsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Tips for Clear Wound Photos",
              style: t.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            _bullet("Make sure the wound is well-lit.", t),
            _bullet("Hold the phone 15–20 cm away.", t),
            _bullet("Keep the wound centered in the frame.", t),
            _bullet("Avoid blurry or shaky shots.", t),
            _bullet("Remove any bandages before taking the photo.", t),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, "ok"),
                      child: Text("Ok", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: SizedBox(
                    height: 44.h,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, "dont_show"),
                      child: Text("Don’t Show again", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _bullet(String text, ThemeData t) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("•  ", style: TextStyle(fontSize: 14.sp)),
          Expanded(
            child: Text(
              text,
              style: t.textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
