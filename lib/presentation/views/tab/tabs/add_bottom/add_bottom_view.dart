import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/data/models/category_model.dart';
import 'package:udevs_todo/data/repositories/category_repository.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/add_bottom/widgets/category_list_item.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/add_bottom/widgets/custom_text_fiel.dart';
import 'package:udevs_todo/presentation/views/widgets/add_bottom_paint.dart';
import 'package:udevs_todo/presentation/views/widgets/buttons/circle_pink_button.dart';
import 'package:udevs_todo/presentation/views/widgets/buttons/custom_blue_button.dart';

class AddBottomView extends StatefulWidget {
  const AddBottomView({super.key});

  @override
  State<AddBottomView> createState() => _AddBottomViewState();
}

class _AddBottomViewState extends State<AddBottomView> {
  late final TextEditingController controller;
  List<CategoryModel> categories = [];
  int selectedCategoryId = -1;

  @override
  void initState() {
    controller = TextEditingController();
    categories = context.read<CategoryRepository>().categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 400.h,
        width: 375.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(375.w, 400.h),
              painter: AddBottomPaint(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 43.h),
                  Center(
                    child: Text(
                      "Add new task",
                      style: RubikFont.w500.copyWith(
                        fontSize: 13.sp,
                        color: ColorConst.c404040,
                      ),
                    ),
                  ),
                  CustomTextField(controller: controller),
                  SizedBox(height: 17.5.h),
                  SizedBox(
                    height: 30.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 15.5.w),
                      children: List.generate(
                        categories.length,
                        (index) => CategoryListItem(
                          category: categories[index],
                          isSelected:
                              categories[index].id == selectedCategoryId,
                          onPressed: () => setState(() {
                            selectedCategoryId = categories[index].id;
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.5.w),
                    child: Divider(
                      color: ColorConst.cCFCFCF,
                      height: 1.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose date',
                          style: RubikFont.w400.copyWith(
                            fontSize: 13.sp,
                            color: ColorConst.c404040,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Not Choosed',
                          style: RubikFont.w500.copyWith(
                            fontSize: 13.sp,
                            color: ColorConst.c404040,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomBlueButton(
                    onTap: () {},
                    title: 'Add task',
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: -26.5.h,
              child: CirclePinkButton(
                iconPath: Assets.xNoteIcon,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
