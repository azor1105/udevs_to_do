import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'constants/color_const.dart';

class MessageUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConst.primaryColor,
        textColor: Colors.white,
        fontSize: 16.sp,
      );

  static void showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text ?? "",
          style: RubikFont.w500.copyWith(
            fontSize: 16.sp,
            color: ColorConst.white,
          ),
        ),
        backgroundColor: ColorConst.primaryColor,
      ),
    );
  }
}
