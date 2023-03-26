import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        backgroundColor: ColorConst.primaryColor,
      ),
      child: Text(
        title,
        style: RubikFont.w400.copyWith(
          fontSize: 13.sp,
          color: ColorConst.white,
        ),
      ),
    );
  }
}
