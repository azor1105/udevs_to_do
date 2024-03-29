import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:udevs_todo/bloc/todo_bloc.dart';
import 'package:udevs_todo/data/models/cached_todo_model.dart';
import 'package:udevs_todo/data/repositories/category_repository.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/utils/rubik_font.dart';
import 'package:udevs_todo/presentation/views/widgets/checkbox/custom_check_box.dart';
import 'custom_slide_item.dart';
import 'edit_bottom_view.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.cachedTodo,
    required this.showDay,
  });

  final CachedTodoModel cachedTodo;
  final bool showDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDay)
          Padding(
            padding: EdgeInsets.only(bottom: 15.h, top: 5.h),
            child: Text(
              DateTime.now().difference(cachedTodo.dateTime).inDays == 0
                  ? "Today"
                  : DateFormat.MMMEd().format(cachedTodo.dateTime),
              style: RubikFont.w500
                  .copyWith(fontSize: 13.sp, color: ColorConst.c8B87B3),
            ),
          ),
        Slidable(
          key: ValueKey(cachedTodo.id),
          endActionPane: ActionPane(
            extentRatio: 0.28,
            motion: const ScrollMotion(),
            children: [
              CustomSlideItem(
                margin: EdgeInsets.only(left: 12.w, right: 6.w),
                iconPath: Assets.commentIcon,
                color: ColorConst.cC4CEF5,
                onTap: () {
                  showModalBottomSheet(
                    elevation: 0.0,
                    backgroundColor: ColorConst.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => EditBottomView(todoModel: cachedTodo),
                  );
                },
              ),
              CustomSlideItem(
                iconPath: Assets.trashIcon,
                color: ColorConst.cFFCFCF,
                onTap: () {
                  context.read<TodoBloc>().add(
                        DeleteTodoEvent(
                          id: cachedTodo.id!,
                        ),
                      );
                },
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
                    color: context.read<CategoryRepository>().getColorById(
                          cachedTodo.categoryId,
                        ),
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
                          isSelected: cachedTodo.isDone,
                          onChanged: (v) => context.read<TodoBloc>().add(
                                UpdateTodoEvent(
                                  todoModel: cachedTodo.copyWith(isDone: v),
                                ),
                              ),
                        ),
                        SizedBox(width: 11.w),
                        Text(
                          DateFormat.Hm().format(cachedTodo.dateTime),
                          style: RubikFont.w400.copyWith(
                            fontSize: 11.sp,
                            color: ColorConst.cC6C6C8,
                          ),
                        ),
                        SizedBox(width: 13.w),
                        Expanded(
                          child: Text(
                            cachedTodo.title,
                            style: RubikFont.w500.copyWith(
                              decorationColor: ColorConst.cD9D9D9,
                              decoration: cachedTodo.isDone
                                  ? TextDecoration.underline
                                  : null,
                              fontSize: 14.sp,
                              color: cachedTodo.isDone
                                  ? ColorConst.cD9D9D9
                                  : ColorConst.c554E8F,
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
}
