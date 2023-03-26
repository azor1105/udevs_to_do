part of 'todo_bloc.dart';

enum TodoStatus { initial, success, error, loading }

extension TodoStatusX on TodoStatus {
  bool get isInitial => this == TodoStatus.initial;
  bool get isSuccess => this == TodoStatus.success;
  bool get isError => this == TodoStatus.error;
  bool get isLoading => this == TodoStatus.loading;
}

class TodoState extends Equatable {
  const TodoState({
    this.todoStatus = TodoStatus.initial,
    this.showReminder = true,
    required this.todos,
  });

  final TodoStatus todoStatus;
  final bool showReminder;
  final List<CachedTodoModel> todos;

  TodoState copyWith({
    TodoStatus? todoStatus,
    bool? showReminder,
    List<CachedTodoModel>? todos,
  }) =>
      TodoState(
        todos: todos ?? this.todos,
        todoStatus: todoStatus ?? this.todoStatus,
        showReminder: showReminder ?? this.showReminder,
      );

  @override
  List<Object> get props => [todoStatus, showReminder, todos];
}