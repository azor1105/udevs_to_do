part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class CloseReminderEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  const AddTodoEvent({required this.cachedTodoModel});
  final CachedTodoModel cachedTodoModel;

  @override
  List<Object> get props => [cachedTodoModel];
}