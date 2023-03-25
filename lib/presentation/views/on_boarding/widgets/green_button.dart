import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({super.key, required this.onPressed});
  
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 258.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: ColorConst.greenGradient,
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            color: ColorConst.c66C81C.withOpacity(0.53),
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.zero,
          foregroundColor: Colors.grey,
        ),
        child: Center(
          child: Text(
            "Get Started",
            style: RubikFont.w400.copyWith(
              fontSize: 15.sp,
              color: ColorConst.cFCFCFC,
            ),
          ),
        ),
      ),
    );
  }
}
