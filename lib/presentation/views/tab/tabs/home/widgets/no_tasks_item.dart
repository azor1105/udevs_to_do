import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';

class NoTasksItem extends StatelessWidget {
  const NoTasksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.clipBoardImg,
              height: 164.h,
            ),
            SizedBox(height: 70.h),
            Text(
              'No tasks',
              style: RubikFont.w500.copyWith(fontSize: 22.sp),
            ),
          ],
        ),
      ),
    );
  }
}
