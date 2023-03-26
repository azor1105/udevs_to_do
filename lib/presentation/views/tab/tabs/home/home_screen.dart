import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/home/widgets/todo_item.dart';
import 'package:udevs_todo/presentation/views/widgets/checkbox/custom_check_box.dart';
import 'package:udevs_todo/presentation/views/widgets/per_delegates/reminder_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.cF9FCFF,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: ReminderDelegate()),
          // SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: 18.w),
          //   sliver: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) {
          //         return const TodoItem();
          //       },
          //       childCount: 1,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
