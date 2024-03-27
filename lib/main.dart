import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "bloc_todo_app/bloc/todo_bloc/todo_bloc.dart";
import "bloc_todo_app/ui/bloc_todo_app_main_page.dart";

void main(){
  runApp(BlocProvider<TodoBloc>(
    create: (context) => TodoBloc(),
    child: MaterialApp(
      theme: ThemeData.dark(),
      home: BlocTodoApp(),),
  ));
}
