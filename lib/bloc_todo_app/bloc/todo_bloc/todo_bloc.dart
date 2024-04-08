import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial(const [])) {
    on<TodoEvent>((TodoEvent event, Emitter<TodoState> emitter) {
      if (event is AddNewTodoToList) {
        String tempValue = event.newTodo;
        List tempTodoList = [
          ...state.todoList!.toList()
        ]; // Copy todoList into tempTodoLIst

        tempTodoList.add(tempValue); //Add item to the list

        emit(TodoInitial(state.todoList = tempTodoList));
      } else {
        if (event is RemoveTodoFromList) {
          int index = event.index;
          List tempTodoList = [
            ...state.todoList!.toList()
          ]; // Copy todoList into tempTodoLIst

          tempTodoList.removeAt(index); // Remove item from the list

          emit(TodoInitial(state.todoList = tempTodoList));
        } else if (event is UpdateTodoOfList) {
          int index = event.index;
          String newValue = event.editedValue;
          List tempTodoList = [
            ...state.todoList!.toList()
          ]; //Copy todoList into tempTodoLIst

          tempTodoList[index] = newValue; // Update item in the list

          emit(TodoInitial(state.todoList = tempTodoList));
        }
      }
    });
  }
}
