import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/provider_todo_app/provider/todo_provider.dart';

class TodoProviderApp extends StatelessWidget {
  TodoProviderApp({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TextField to get todoTitle from user
        title: TextField(
          textDirection: TextDirection.rtl,
          controller: textEditingController,
          decoration: const InputDecoration(
              hintText: "چیکار کنیم",
              hintTextDirection: TextDirection.rtl,
              label: Center(
                child: Text("اینجا کارهات رو بنویس"),
              )),
        ),
      ),

      // body wrapped with Directionality for better rtl UX
      body: Directionality(
        textDirection: TextDirection.rtl,

        // Body updates by consumer when ever todoList changes
        child: Consumer<TodoProviderClass>(
          builder: (context, TodoProvider, child) => ListView.builder(
            itemCount: TodoProvider.todoList.length,
            itemBuilder: (context, index) =>

                //Used gesture detector because
                //the update operation is works with long press
                GestureDetector(
              onLongPress: () => updateTodoList(context, index),

              // for better control over editing
              child: Card(
                child: ListTile(
                  title: Text(TodoProvider.todoList[index].toString()),

                  // IconButton to remove the item from the list
                  trailing: IconButton(
                    //Just a normal Icon. can be changed in the future
                    icon: const Icon(Icons.delete_outline_rounded),

                    onPressed: () {
                      //because it is inside a consumer, it does not need context and watch
                      TodoProvider.removeTodoFromList(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      //The only reason of this positioning is increasing UX for lefties
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // This FAB adds entered title in text box to todoList
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Variable defined to separate data and UI layer
          String newTodo = textEditingController.text;

          //Call addNewTodo method from TodoProvider to add newTodo to todoList
          context.read<TodoProviderClass>().addNewTodo(newTodo);

          // Empty TextField for better UX
          textEditingController.clear();
        },

        //Icon may change in the future
        child: const Icon(Icons.list_alt),
      ),
    );
  }

  updateTodoList(BuildContext context, int index) {
    TextEditingController textEditingController = TextEditingController();

    //Here we have the dialog to edit an item
    showDialog(
        context: context,
        builder: (context) {
          TodoProviderClass todoProviderClass =
              Provider.of<TodoProviderClass>(context, listen: false);
          return AlertDialog(
            title: const Center(child: Text("تغییری داریم؟")),
            content: Column(
              children: [
                Text(todoProviderClass.todoList[index]),
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(),
                )
              ],
            ),
            actions: [
              // Does nothing to the list
              TextButton(
                  onPressed: () {
                    textEditingController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("!بیخیال")),

              //Updates the title
              FilledButton(
                  onPressed: () {
                    String updateTodo = textEditingController.text;

                    Provider.of<TodoProviderClass>(context, listen: false)
                        .updateTodoList(index, updateTodo);
                    Navigator.pop(context);
                  },
                  child: const Text("(: بزن بریم"))
            ],
          );
        });
  }
}
