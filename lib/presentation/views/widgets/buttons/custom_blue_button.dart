import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomBlueButton extends StatelessWidget {
  const CustomBlueButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        height: 53.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 26.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          gradient: const LinearGradient(
            colors: ColorConst.blueGradient,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              color: ColorConst.c6894EE,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: RubikFont.w500.copyWith(
              fontSize: 18.sp,
              color: ColorConst.white,
            ),
          ),
        ),
      ),
    );
  }
}
