import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:udevs_todo/bloc/todo_bloc.dart';
import 'package:udevs_todo/data/models/cached_todo_model.dart';
import 'package:udevs_todo/data/models/category_model.dart';
import 'package:udevs_todo/data/repositories/category_repository.dart';
import 'package:udevs_todo/data/services/notification/notification_service.dart';
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

class EditBottomView extends StatefulWidget {
  const EditBottomView({super.key, required this.todoModel});

  final CachedTodoModel todoModel;

  @override
  State<EditBottomView> createState() => _EditBottomViewState();
}

class _EditBottomViewState extends State<EditBottomView> {
  late final TextEditingController controller;
  List<CategoryModel> categories = [];
  late DateTime pickedDate;
  late int selectedCategoryId;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = widget.todoModel.title;
    selectedCategoryId = widget.todoModel.categoryId;
    pickedDate = widget.todoModel.dateTime;
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
                      "Edit task",
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
                          onPressed: () => setState(
                            () {
                              selectedCategoryId = categories[index].id;
                            },
                          ),
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
                            if (dateTime != null) {
                              setState(() {
                                pickedDate = dateTime;
                              });
                            }
                          },
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "${DateFormat.MMMMd().format(pickedDate)} ${DateFormat.Hm().format(pickedDate)} ",
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
                      if (controller.text == '') {
                        MessageUtils.getMyToast(
                            message: 'Please fill the field');
                      } else if (pickedDate
                              .difference(DateTime.now())
                              .inMinutes <=
                          0) {
                        MessageUtils.getMyToast(
                            message: 'Task time must be in the future');
                      } else {
                        var todo = widget.todoModel.copyWith(
                          categoryId: selectedCategoryId,
                          dateTime: pickedDate,
                          title: controller.text,
                        );
                        context.read<TodoBloc>().add(
                              UpdateTodoEvent(
                                todoModel: todo,
                              ),
                            );
                        LocalNotificationService.localNotificationService
                            .cancelNotificationById(todo.id!);
                        LocalNotificationService.localNotificationService
                            .scheduleNotification(
                          cachedTodo: todo,
                          categoryName: context
                              .read<CategoryRepository>()
                              .getNameById(selectedCategoryId),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    title: 'Save task',
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
