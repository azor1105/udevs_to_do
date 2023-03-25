import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CirclePinkButton extends StatelessWidget {
  const CirclePinkButton({
    super.key,
    required this.onTap,
    this.iconPath,
  });

  final VoidCallback onTap;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: ColorConst.pinkGradient),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorConst.cF456C3.withOpacity(0.47),
              offset: const Offset(0, 7),
              blurRadius: 9,
            )
          ],
        ),
        child: SvgPicture.asset(
          iconPath ?? Assets.addIcon,
          height: 25.h,
        ),
      ),
    );
  }
}
