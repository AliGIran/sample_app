part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

// class Increment extends TodoEvent {}

class AddNewTodo extends TodoEvent{
  final String newTodo;

  AddNewTodo(this.newTodo);
}


class RemoveTodoFromList extends TodoEvent{
  final int index;

  RemoveTodoFromList(this.index);
}