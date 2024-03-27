import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List todoList = [];

  addNewTodo(String newTodo) {
    todoList.add(newTodo);
    notifyListeners();
  }

  removeFromTheList(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}
