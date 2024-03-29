import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../caddie_Pages/home_screen.dart';
import '../member_Pages/home_screen_member.dart';

class NewLoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const NewLoginPage({super.key, required this.showRegisterPage});

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  //adding this
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final dbRef =
      FirebaseFirestore.instance.collection("users"); //modified problem

  Future signIn() async {//was futire
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim());
        /*
        return FutureBuilder<DocumentSnapshot>(
        builder: ((context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          }
          return Text("oh no");
        }),

  */
    
  }
  

  

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.golf_course_outlined,
                size: 100,
              ),
              SizedBox(height: 50),

              Text('Bogey Management',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
              SizedBox(height: 50),
              Text('A Golf Club App',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Email',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //pasword
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _controllerPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Password',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //register
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'sign in',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'not a member? ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text('register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
