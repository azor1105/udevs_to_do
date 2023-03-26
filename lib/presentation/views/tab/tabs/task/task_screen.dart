import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/data/models/category_model.dart';
import 'package:udevs_todo/data/repositories/category_repository.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/task/widgets/category_grid_item.dart';
import 'package:udevs_todo/presentation/views/widgets/per_delegates/reminder_delegate.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories =
        context.read<CategoryRepository>().categories;
    return Scaffold(
      backgroundColor: ColorConst.cF9FCFF,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: ReminderDelegate()),
          SliverPadding(
            padding: EdgeInsets.only(left: 18.w),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Projects',
                style: RubikFont.w500.copyWith(
                  fontSize: 13.sp,
                  color: ColorConst.c8B87B3,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 31.h),
            sliver: SliverGrid.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 19.w,
                  mainAxisSpacing: 23.5.w),
              itemBuilder: (context, index) {
                return CategoryGridItem(
                  categoryModel: categories[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
