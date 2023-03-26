import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:udevs_todo/data/models/cached_todo_model.dart';
import 'package:udevs_todo/data/repositories/todo_repository.dart';
import 'package:udevs_todo/data/services/notification/notification_service.dart';
import 'package:udevs_todo/presentation/utils/message_utils.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.todoRepository) : super(const TodoState(todos: [])) {
    on<CloseReminderEvent>(closeReminder);
    on<AddTodoEvent>(addTodo);
    on<GetTodosEvent>(getTodos);
    on<DeleteTodoEvent>(deleteTodo);
    on<UpdateTodoEvent>(updateTodo);
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
    } else if (event.dateTime!.difference(DateTime.now()).inMinutes <= 0) {
      MessageUtils.getMyToast(message: 'Task time must be in the future');
    } else {
      Navigator.of(event.context).pop();
      CachedTodoModel cachedTodoModel = await todoRepository.addCacheToDo(
        CachedTodoModel(
          categoryId: event.selectedCategoryId,
          title: event.title,
          dateTime: event.dateTime!,
          isDone: false,
        ),
      );
      LocalNotificationService.localNotificationService.scheduleNotification(
        cachedTodo: cachedTodoModel,
        categoryName: event.categoryName,
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
  ) {
    todoRepository.deleteCachedTodoById(event.id);
    var todos = state.todos;
    todos.removeWhere((element) => element.id == event.id);
    LocalNotificationService.localNotificationService.cancelNotificationById(
      event.id,
    );
    emit(state.copyWith(todos: todos));
  }

  void updateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) {
    var todos = state.todos;
    for (int i = 0; i < todos.length; i++) {
      if (todos[i].id == event.todoModel.id) {
        todos.removeAt(i);
        todos.insert(i, event.todoModel);
        break;
      }
    }
    emit(state.copyWith(todos: todos));
    todoRepository.updateCachedTodo(cachedTodo: event.todoModel);
  }

  int getTaskCountByCatgory(int categoryId) {
    int count = 0;
    List<CachedTodoModel> todos = state.todos;
    for (var todo in todos) {
      if (todo.categoryId == categoryId) count++;
    }
    return count;
  }
}
