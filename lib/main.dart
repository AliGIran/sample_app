import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:provider/provider.dart";
import "package:sample_app/provider_todo_app/provider/todo_provider.dart";

import "bloc_todo_app/bloc/todo_bloc/todo_bloc.dart";
import "bloc_todo_app/ui/bloc_todo_app_main_page.dart";
import "provider_todo_app/ui/provider_todo_app_main_page.dart";

/*void main(){
  runApp(BlocProvider<TodoBloc>(
    create: (context) => TodoBloc(),
    child: MaterialApp(
      theme: ThemeData.dark(),
      home: BlocTodoApp(),),
  ));
}*/

void main() {
  runApp(ChangeNotifierProvider(create: (context) => TodoProvider(),child: MaterialApp(
    theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.dark)),
    home: TodoProviderApp(),
  ),));
}
