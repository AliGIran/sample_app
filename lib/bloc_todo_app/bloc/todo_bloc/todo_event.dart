part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddNewTodoToList extends TodoEvent {
  String newTodo;

  AddNewTodoToList(this.newTodo);
}

class RemoveTodoFromList extends TodoEvent {
  int index;

  RemoveTodoFromList(this.index);
}

class UpdateTodoOfList extends TodoEvent {
  int index;
  String editedValue;

  UpdateTodoOfList(this.index, this.editedValue);
}
