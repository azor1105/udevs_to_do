import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:udevs_todo/bloc/todo_bloc.dart';
import 'package:udevs_todo/data/models/category_model.dart';
import 'package:udevs_todo/data/repositories/category_repository.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/date_time_utils.dart';
import 'package:udevs_todo/presentation/utils/message_utils.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/add_bottom/widgets/category_list_item.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/add_bottom/widgets/custom_text_fiel.dart';
import 'package:udevs_todo/presentation/views/widgets/bottom_paint.dart';
import 'package:udevs_todo/presentation/views/widgets/buttons/circle_pink_button.dart';
import 'package:udevs_todo/presentation/views/widgets/buttons/custom_blue_button.dart';
import 'package:udevs_todo/presentation/views/widgets/buttons/simple_button.dart';

class AddBottomView extends StatefulWidget {
  const AddBottomView({super.key});

  @override
  State<AddBottomView> createState() => _AddBottomViewState();
}

class _AddBottomViewState extends State<AddBottomView> {
  late final TextEditingController controller;
  List<CategoryModel> categories = [];
  int selectedCategoryId = -1;
  DateTime? pickedDate;

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
              painter: BottomPaint(),
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
                    child: Row(
                      children: [
                        SimpleButton(
                          title: 'Choose date',
                          onPressed: () async {
                            DateTime? dateTime =
                                await DateTimeUtils.getDateTime(
                              context: context,
                            );
                            if (dateTime == null) {
                              MessageUtils.getMyToast(
                                message: 'Please choose date and time',
                              );
                            } else {
                              setState(() {
                                pickedDate = dateTime;
                              });
                            }
                          },
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          pickedDate == null
                              ? 'Not Choosed'
                              : "${DateFormat.MMMMd().format(pickedDate!)} ${DateFormat.Hm().format(pickedDate!)} ",
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
                    onTap: () {
                      context.read<TodoBloc>().add(
                            AddTodoEvent(
                              selectedCategoryId: selectedCategoryId,
                              title: controller.text,
                              dateTime: pickedDate,
                              context: context,
                              categoryName: context
                                  .read<CategoryRepository>()
                                  .getNameById(selectedCategoryId),
                            ),
                          );
                    },
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
