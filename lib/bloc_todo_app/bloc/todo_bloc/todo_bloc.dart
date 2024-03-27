import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial(const [])) {
    on<TodoEvent>((TodoEvent event, Emitter<TodoState> emitter) {
      // TODO: implement event handler

      List tempTodoList;
      String tempNewTodo;
      int tempIndex;

      if (event is AddNewTodo) {
        tempNewTodo = event.newTodo.toString();
        print(tempNewTodo);

        tempTodoList = [...state.todoList!.toList()];
        print(tempTodoList.toString());

        tempTodoList.add(tempNewTodo);
        print(tempTodoList.toString());

        emit(TodoInitial(state.todoList = tempTodoList));

        // emit(TodoInitial((state.counter! + 1)));
      } else if (event is RemoveTodoFromList) {
        tempIndex = event.index;

        tempTodoList = [...state.todoList!.toList()];
        print(tempTodoList.toString());

        tempTodoList.removeAt(tempIndex);

        emit(TodoInitial(state.todoList = tempTodoList));
      }
    });
  }
}
