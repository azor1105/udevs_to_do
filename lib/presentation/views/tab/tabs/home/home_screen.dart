import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/widgets/appbar/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.cF9FCFF,
      body: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
