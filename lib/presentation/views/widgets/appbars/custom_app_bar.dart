import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    scrolledUnderElevation: 0.0,
      elevation: 0.0,
      flexibleSpace: Container(
        width: double.infinity,
        height: 106.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: ColorConst.appBarGradient),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            circleItem(
              size: 211,
              left: -80,
              top: -105,
            ),
            circleItem(
              size: 93,
              left: 299,
              top: -18,
            ),
            Positioned(
              left: 19.w,
              right: 19.w,
              bottom: 11.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Brenda!",
                        style: RubikFont.w400.copyWith(
                          fontSize: 18.sp,
                          color: ColorConst.white,
                        ),
                      ),
                      Text(
                        "Today you have 9 tasks",
                        style: RubikFont.w400.copyWith(
                          fontSize: 18.sp,
                          color: ColorConst.white,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: const NetworkImage(
                      'https://variety.com/wp-content/uploads/2022/11/Screen-Shot-2022-11-02-at-8.33.52-AM.png?w=681&h=383&crop=1&resize=681%2C383',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 68.h);

  @override
  Widget get child => throw UnimplementedError();

  Widget circleItem({
    required double size,
    double? left,
    double? right,
    double? bottom,
    double? top,
  }) {
    return Positioned(
      left: left?.w,
      right: right?.w,
      top: top?.h,
      bottom: bottom?.h,
      child: Container(
        height: size.h,
        width: size.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConst.white.withOpacity(0.17),
        ),
      ),
    );
  }
}
