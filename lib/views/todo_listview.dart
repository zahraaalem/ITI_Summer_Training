import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_app/models/todo_model.dart';
import 'package:futter_app/services/todo_services.dart';
import 'package:bloc/bloc.dart';
import 'package:futter_app/views/todos/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Todo_Listview extends StatefulWidget {
  const Todo_Listview({Key? key}) : super(key: key);

  @override
  State<Todo_Listview> createState() => _Todo_ListviewState();
}

class _Todo_ListviewState extends State<Todo_Listview> {



  //TodoDataModel todoModel = TodoDataModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.redAccent,),
        body: BlocProvider(
          create: (context) => TodoCubit(),
          child: BlocBuilder<TodoCubit, TodoState>(
            // BlocConsumer<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is TodoLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TodoSuccess) {
                return ListView.builder(
                  itemCount: context
                      .watch<TodoCubit>()
                      .todoList
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(context
                          .watch<TodoCubit>()
                          .todoList[index].title ?? "--"),
                      subtitle: context
                          .watch<TodoCubit>()
                          .todoList[index].completed == true
                          ? Text('Completed')
                          : Text('Not Completed'),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Error in this screen"),
                );
              }
            },
            // listener: (context, state) {
            //   if (state is UsersError) {
            //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //       content: Text("Hello we have error"),
            //     ));
            //     print("Hello");
            //   }
            // },
          ),
        ));


  }
}


// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.lightGreenAccent,
//     ),
//     body: ListView.builder(itemBuilder:(BuildContext context, int index){
//       return ListTile(
//         title :Text(todoList[index].title ?? "--"),
//         subtitle: todoList[index].completed == true ? Text('Completed') : Text('Not Completed'),
//       );
//     }),
//   );
// }
