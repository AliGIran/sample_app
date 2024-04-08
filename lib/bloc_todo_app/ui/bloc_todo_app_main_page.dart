import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc_todo_app/bloc/todo_bloc/todo_bloc.dart';

class BlocTodoApp extends StatelessWidget {
  BlocTodoApp({super.key});

  TodoBloc? bloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        //Used surfaceTintColor to keep appbar color after scroll
        surfaceTintColor: Colors.transparent,

        //A place that user adds his todoTitle
        title: TextField(
          //Because the app is for Iranian users
          textDirection: TextDirection.rtl,

          //for better UX
          textAlign: TextAlign.right,
          controller: textEditingController,
          decoration: const InputDecoration(
              hintText: "چیکار کنیم؟",

              //For better UX
              hintTextDirection: TextDirection.rtl,
              hintFadeDuration: Duration(seconds: 1), //No reason
              label: Center(
                child: Text("اینجا کارهات رو وارد کن"),
              )),
        ),
      ),

      // The app is for Iranian Use so directionality defined for better UX
      body: Directionality(
        textDirection: TextDirection.rtl,

        // Refresh body everytime the list changes
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc: bloc,
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.todoList?.length,

              //Gesture detector used to edit items by long press
              itemBuilder: (context, index) => GestureDetector(
                //editing an item
                onLongPress: () {
                  // to separate data and UI layer

                  String tempValue = state.todoList![index];

                  editTodoTitleForm(context, index, tempValue);
                },

                //Used card for better UI
                child: Card(
                  child: ListTile(
                    title: Text(state.todoList![index].toString()),

                    //Icon button used to remove item for simplicity
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline_rounded),
                      onPressed: () {
                        bloc?.add(
                            RemoveTodoFromList(index)); //Remove selected item
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

      //FAB to add new Item from app bar text field to the list
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.list_rounded),
        onPressed: () {
          // to separate data and UI layer
          String newTodo = textEditingController.text;

          bloc?.add(AddNewTodoToList(newTodo)); // Add new item to the list
          textEditingController.clear();
        },
      ),
    );
  }

  editTodoTitleForm(BuildContext context, int index, String oldTitle) {
    TextEditingController textEditingController = TextEditingController();

    //Shows a form to edit selected item
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          //To keep user inform about the title he wants to edit
          title: Text(oldTitle),

          //Where user type edited title
          content: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(),
          ),

          actionsAlignment: MainAxisAlignment.center,
          actions: [
            FilledButton(
                onPressed: () {
                  // Separate data and UI layer
                  String editedValue = textEditingController.text;

                  bloc?.add(UpdateTodoOfList(index, editedValue)); //Update item

                  Navigator.pop(context);
                },
                child: const Text("اصلاحش کن")),
            OutlinedButton(
                onPressed: () {
                  textEditingController.clear();
                  Navigator.pop(context);
                },
                child: const Text("بیخیال"))
          ],
        ),
      ),
    );
  }
}
