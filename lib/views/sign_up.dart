import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_app/views/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  final auth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD10000),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Form(
              key : _formKey,
              child: Column(children: [
                Image.asset('assets/images/iti-logo.png',
                  width: 200,height: 150,),
                SizedBox(height: 20,),
                Text("Sign Up!",
                  style: TextStyle(
                      color:Colors.black,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold ),),
                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value){
                      if(value!.contains('@')){
                        return null;

                      }else{
                        return " Invalid Email";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),


                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value){
                      if(value!.length >= 8){
                        return null;

                      }else{
                        return " Password must be at least 8 characters";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.0,),
                InkWell(
                  onTap: () async {
                    if(_formKey.currentState!.validate()){


                      print(emailController.text);
                      print(passwordController.text);
                      // sleep(Duration(seconds: 10));
                     // email = emailController.text;
                      //password = passwordController.text;

                      try{
                        var user = await auth.createUserWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text);
                      }catch (e){
                        print('$e while creating user!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                        // print();
                      }
                      //print(emailController.text);
                      saveEmail(emailController.text);
                      Navigator.push(context, MaterialPageRoute( builder: (context) => Login()));              }
                  },
                  child: Container(
                    width: 350.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD10000),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(child: Text("Sign Up",
                      style: TextStyle(color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),



                    )),
                  ),
                )


              ],)),
        ),

      ),
    );

  }

  saveEmail(String email) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);

  }


}
