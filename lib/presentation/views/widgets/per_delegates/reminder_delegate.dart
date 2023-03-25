import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';

class ReminderDelegate extends SliverPersistentHeaderDelegate {
  ReminderDelegate();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: 132.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 13.h,
        horizontal: 18.w,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: ColorConst.appBarGradient,
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConst.white.withOpacity(0.31),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -5.h,
              right: -5.h,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.xNoteIcon,
                  height: 15.h,
                ),
              ),
            ),
            Positioned(
              left: 16.w,
              top: 21.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today Reminder",
                    style: RubikFont.w500.copyWith(
                      color: ColorConst.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Meeting with client",
                    style: RubikFont.w400
                        .copyWith(color: ColorConst.cF3F3F3, fontSize: 11.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "13.00 PM",
                    style: RubikFont.w400
                        .copyWith(color: ColorConst.cF3F3F3, fontSize: 11.sp),
                  )
                ],
              ),
            ),
            Positioned(
              top: 17.h,
              right: 21.w,
              child: Image.asset(
                Assets.bellImg,
                height: 66.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 132.h;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
