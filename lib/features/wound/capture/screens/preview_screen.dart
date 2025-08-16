import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../analysis/screens/analysis_loading_screen.dart';

class PreviewScreen extends StatelessWidget {
  final XFile file;
  const PreviewScreen({super.key, required this.file});

  Future<Uint8List> _bytes() => file.readAsBytes();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Your Photo', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Container(
                  color: const Color(0xFFF2F2F2),
                  child: FutureBuilder<Uint8List>(
                    future: _bytes(),
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Image.memory(snap.data!, fit: BoxFit.contain);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              "Make sure the photo is clear and the wound is\nvisible before saving.",
              style: t.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                color: t.colorScheme.onSurface.withOpacity(.7),
              ),
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AnalysisLoadingScreen( imagePath: '',),
                          ),
                        );
                      },
                      icon: const Icon(Icons.bookmark_add_outlined),
                      label: Text('Save and Continue', style: TextStyle(fontSize: 14.sp)),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.refresh),
                      label: Text('Re-take Photo', style: TextStyle(fontSize: 14.sp)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
