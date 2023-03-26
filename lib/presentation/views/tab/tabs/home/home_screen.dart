import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/bloc/todo_bloc.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/home/widgets/no_tasks_item.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/home/widgets/todo_item.dart';
import 'package:udevs_todo/presentation/views/widgets/per_delegates/reminder_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.cF9FCFF,
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoStatus.isSuccess) {
            return state.todos.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      if (state.showReminder &&
                          state.todos
                              .where((element) => !element.isDone)
                              .toList()
                              .isNotEmpty)
                        SliverPersistentHeader(
                          delegate: ReminderDelegate(
                            state.todos
                                .where((element) => !element.isDone)
                                .toList()[0],
                          ),
                        ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return TodoItem(
                                cachedTodo: state.todos[index],
                                showDay: index == 0 ||
                                    state.todos[index].dateTime
                                            .difference(
                                                state.todos[index - 1].dateTime)
                                            .inDays >
                                        0,
                              );
                            },
                            childCount: state.todos.length,
                          ),
                        ),
                      ),
                    ],
                  )
                : const NoTodosItem();
          } else if (state.todoStatus == TodoStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
