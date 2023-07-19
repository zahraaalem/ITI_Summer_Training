import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  void initstate(){
    super.initState();
    getEmail();
  }
  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD10000),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height : 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,

                ),
                color : Color(0xFFD10000),
                borderRadius: BorderRadius.circular(5),
              ),

              child: Center(
                child: Text("signed in successfully!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ),
          )
        ],
      ),
    );
  }

  getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('email') ?? '--';
    setState(() {

    });


  }
}
