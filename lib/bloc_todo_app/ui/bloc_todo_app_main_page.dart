import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc_todo_app/bloc/todo_bloc/todo_bloc.dart';

class BlocTodoApp extends StatelessWidget {
  BlocTodoApp({super.key});

  TodoBloc? bloc = TodoBloc();

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
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: bloc,
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todoList?.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(state.todoList![index]),
              trailing: IconButton(
                  onPressed: () {
                    bloc?.add(RemoveTodoFromList(index));
                  },
                  icon: const Icon(Icons.delete)),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          final String newTodo = textEditingController.text;
          bloc?.add(AddNewTodo(newTodo));
        },
        child: const Icon(Icons.ad_units),
      ),
    );
  }
}
