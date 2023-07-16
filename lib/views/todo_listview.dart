import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_app/models/todo_model.dart';
import 'package:futter_app/services/todo_services.dart';

class Todo_Listview extends StatefulWidget {
  const Todo_Listview({Key? key}) : super(key: key);

  @override
  State<Todo_Listview> createState() => _Todo_ListviewState();
}

class _Todo_ListviewState extends State<Todo_Listview> {

  //TodoDataModel todoModel = TodoDataModel();
  List<TodoDataModel> todoList = [];

  getToDo()async {
    todoList = await Todo_Service().GetToDoList();
    setState(() {

    });

  }

  void initState(){
    super.initState();
    getToDo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: ListView.builder(itemBuilder:(BuildContext context, int index){
        return ListTile(
          title :Text(todoList[index].title ?? "--"),
          subtitle: todoList[index].completed == true ? Text('Completed') : Text('Not Completed'),
        );
      }),
    );
  }
}
