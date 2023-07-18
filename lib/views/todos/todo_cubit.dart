import 'package:bloc/bloc.dart';
import 'package:futter_app/models/todo_model.dart';
import 'package:futter_app/services/todo_services.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()){
    getToDo();
}


  List<TodoDataModel> todoList = [];
  bool isLoading = true;

    getToDo() async {
      emit(TodoLoading());
      try {
        todoList = await Todo_Service().GetToDoList();
        isLoading = false;

        emit(TodoSuccess());
      } catch (e) {
        print(e.toString());
        emit(TodoError());
      }
    }


  }

