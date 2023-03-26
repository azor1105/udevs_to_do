part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class CloseReminderEvent extends TodoEvent {}

class GetTodosEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {
  const DeleteTodoEvent({required this.id});
  final int id;

  @override
  List<Object?> get props => [id];
}

class UpdateStatusEvent extends TodoEvent {
  const UpdateStatusEvent({
    required this.id,
    required this.status,
  });
  final int id;
  final bool status;

  @override
  List<Object?> get props => [id, status];
}

class AddTodoEvent extends TodoEvent {
  const AddTodoEvent({
    required this.selectedCategoryId,
    required this.title,
    this.dateTime,
    required this.context,
  });
  final String title;
  final int selectedCategoryId;
  final DateTime? dateTime;
  final BuildContext context;

  @override
  List<Object?> get props => [
        title,
        selectedCategoryId,
        dateTime,
        context,
      ];
}