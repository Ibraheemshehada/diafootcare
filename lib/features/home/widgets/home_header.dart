import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  final String userFirstName;
  final VoidCallback onNotifications;
  const HomeHeader({super.key, required this.userFirstName, required this.onNotifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundImage: const AssetImage("assets/images/avatar_placeholder.png"),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good morning, $userFirstName",
                    style: Theme.of(context).textTheme.titleMedium),
                Text("Keep taking care",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            onPressed: onNotifications,
            icon: const Icon(Icons.notifications_none_rounded),
          )
        ],
      ),
    );
  }
}
