part of 'todo_bloc.dart';

@immutable
sealed class TodoState {

  List? todoList;


}

final class TodoInitial extends TodoState {

  final List todoList;

  TodoInitial(this.todoList);


}
