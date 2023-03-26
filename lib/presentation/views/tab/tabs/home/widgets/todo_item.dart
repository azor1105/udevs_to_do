import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/widgets/checkbox/custom_check_box.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15.h, top: 5.h),
          child: Text(
            'Today',
            style: RubikFont.w500
                .copyWith(fontSize: 13.sp, color: ColorConst.c8B87B3),
          ),
        ),
        Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            extentRatio: 0.28,
            motion: const ScrollMotion(),
            children: [
              customSlideItem(
                margin: EdgeInsets.only(left: 12.w, right: 6.w),
                iconPath: Assets.commentIcon,
                color: ColorConst.cC4CEF5,
              ),
              customSlideItem(
                iconPath: Assets.trashIcon,
                color: ColorConst.cFFCFCF,
              )
            ],
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 7.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 9,
                    offset: const Offset(0, 9),
                    color: ColorConst.black.withOpacity(0.05)),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 55.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: ColorConst.c373737,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 55.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: ColorConst.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        CustomCheckBox(
                          isSelected: false,
                          onChanged: (v) {},
                        ),
                        SizedBox(width: 11.w),
                        Text(
                          '10.00 AM',
                          style: RubikFont.w400.copyWith(
                            fontSize: 11.sp,
                            color: ColorConst.cC6C6C8,
                          ),
                        ),
                        SizedBox(width: 13.w),
                        Expanded(
                          child: Text(
                            'Meeting with client',
                            style: RubikFont.w500.copyWith(
                              fontSize: 14.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customSlideItem({
    required String iconPath,
    required Color color,
    EdgeInsets? margin,
  }) {
    return Container(
      height: 35.h,
      width: 35.w,
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          height: 16.h,
        ),
      ),
    );
  }
}
