import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/note.dart';
import 'package:intl/intl.dart';

class RecentNoteCard extends StatelessWidget {
  final NoteModel note;
  final Color color;
  const RecentNoteCard({super.key, required this.note, required this.color});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMMM d, y').format(note.date);
    return Container(
      width: 240.w,

      margin: EdgeInsets.only(right: 12.w,bottom: 10.w),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dateStr, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,color: Colors.black)),
          SizedBox(height: 8.h),
          Text(note.text, maxLines: 5, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14.h,color: Colors.black),),
        ],
      ),
    );
  }
}
