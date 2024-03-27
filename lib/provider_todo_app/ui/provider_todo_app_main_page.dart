import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/provider_todo_app/provider/todo_provider.dart';

import '../provider/todo_provider.dart';
import '../provider/todo_provider.dart';

class TodoProviderApp extends StatelessWidget {
  TodoProviderApp({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textEditingController,
          decoration: const InputDecoration(),
        ),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, TodoProvider, child) => ListView.builder(
          itemCount: TodoProvider.todoList.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(TodoProvider.todoList[index].toString()),
            trailing: IconButton(
              onPressed: () {
                TodoProvider.removeFromTheList(index);
              },
              icon: const Icon(Icons.delete_outline_rounded),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String newTodo = textEditingController.text;
          context.read<TodoProvider>().addNewTodo(newTodo);
        },
        child: const Icon(Icons.list_alt),
      ),
    );
  }
}
