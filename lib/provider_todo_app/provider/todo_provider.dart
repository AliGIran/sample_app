import 'package:flutter/material.dart';

class TodoProviderClass extends ChangeNotifier {
  List todoList = [];

  addNewTodo(String newTodo) {
    todoList.add(newTodo);
    notifyListeners();
  }

  removeTodoFromList(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }

  updateTodoList(int index, String updateTodo) {
    List tempTodo = todoList;

    print(todoList.toString());
    print(tempTodo.toString());

    tempTodo[index] = updateTodo;

    todoList = tempTodo;
    notifyListeners();
    print(todoList.toString());
    print(tempTodo.toString());
  }
}
