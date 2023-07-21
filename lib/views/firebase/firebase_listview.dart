import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireBaseListView extends StatefulWidget {
  const FireBaseListView({Key? key}) : super(key: key);

  @override
  State<FireBaseListView> createState() => _FireBaseListViewState();
}

class _FireBaseListViewState extends State<FireBaseListView> {
  final userStream = FirebaseFirestore.instance.collection("users").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder(
        stream: userStream,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text("Loading....");
          }
          var docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder:(context, index){
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(docs[index]["name"]),
                subtitle: Text("${docs[index]["age"]} Years Old"),
              );
            },
          );
        },
      ),

    );
  }
}
