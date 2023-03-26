part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class CloseReminder extends TodoEvent {}

class AddTodo extends TodoEvent {
  const AddTodo({required this.cachedTodoModel});
  final CachedTodoModel cachedTodoModel;

  @override
  List<Object> get props => [cachedTodoModel];
}