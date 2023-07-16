import 'package:dio/dio.dart';
import 'package:futter_app/models/todo_model.dart';

class Todo_Service{

  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoDataModel>> GetToDoList()async{
    List<TodoDataModel> todoList =[];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((e){
      TodoDataModel todo = TodoDataModel.fromJson(e);
      todoList.add(todo);
    });

    return todoList;

  }
}