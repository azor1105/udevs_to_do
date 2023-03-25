import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/data/local_data/local_data.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/constants/local_data_keys.dart';
import 'package:udevs_todo/presentation/utils/constants/route_names.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/on_boarding/widgets/green_button.dart';

class MainOnBoardingScreen extends StatelessWidget {
  const MainOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(Assets.onBoardingImg, height: 195.h),
              SizedBox(height: 113.h),
              Text(
                "Reminders made simple",
                style: RubikFont.w500.copyWith(fontSize: 22.sp),
              ),
              const Spacer(),
              GreenButton(
                onPressed: () {
                  LocalData.putBool(
                    key: LocalDataKeys.onBoardingShowed,
                    value: true,
                  );
                  Navigator.pushReplacementNamed(context, RouteNames.tab);
                },
              ),
              SizedBox(height: 92.h),
            ],
          ),
        ),
      ),
    );
  }
}
