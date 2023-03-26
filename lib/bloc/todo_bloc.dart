import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:udevs_todo/data/models/cached_todo_model.dart';
import 'package:udevs_todo/data/repositories/todo_repository.dart';
import 'package:udevs_todo/presentation/utils/message_utils.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.todoRepository) : super(const TodoState(todos: [])) {
    on<CloseReminderEvent>(closeReminder);
    on<AddTodoEvent>(addTodo);
    on<GetTodosEvent>(getTodos);
    on<DeleteTodoEvent>(deleteTodo);
    on<UpdateStatusEvent>(updateStatus);
  }

  final TodoRepository todoRepository;

  void closeReminder(
    CloseReminderEvent event,
    Emitter<TodoState> emit,
  ) {
    emit(state.copyWith(showReminder: false));
  }

  void addTodo(
    AddTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    if (event.title == '') {
      MessageUtils.getMyToast(message: 'Please, fill the field');
    } else if (event.selectedCategoryId == -1) {
      MessageUtils.getMyToast(message: 'Please, select project');
    } else if (event.dateTime == null) {
      MessageUtils.getMyToast(message: 'Please, choose the date');
    } else {
      Navigator.of(event.context).pop();
      await todoRepository.addCacheToDo(
        CachedTodoModel(
          categoryId: event.selectedCategoryId,
          title: event.title,
          dateTime: event.dateTime!,
          isDone: false,
        ),
      );
      add(GetTodosEvent());
    }
  }

  void getTodos(
    GetTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(todoStatus: TodoStatus.loading));
    List<CachedTodoModel> todos = await todoRepository.getAllToDos();
    emit(state.copyWith(todos: todos, todoStatus: TodoStatus.success));
  }

  void deleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    await todoRepository.deleteCachedTodoById(event.id);
    add(GetTodosEvent());
  }

  void updateStatus(
    UpdateStatusEvent event,
    Emitter<TodoState> emit,
  ) async {
    // var todos = state.todos;
    // for (var element in todos) {
    //   if (element.id == event.id) {
    //     element.copyWith(isDone: event.status);
    //   }
    // }
    // emit(state.copyWith(todos: todos));
    await todoRepository.updateCachedTodoStatus(
      event.id,
      event.status,
    );
    add(GetTodosEvent());
  }
}
