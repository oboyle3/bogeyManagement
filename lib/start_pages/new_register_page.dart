import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewRegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const NewRegisterPage({super.key, required this.showLoginPage});

  @override
  State<NewRegisterPage> createState() => _NewRegisterPageState();
}

class _NewRegisterPageState extends State<NewRegisterPage> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerFirstName = TextEditingController();
  final _controllerLastName = TextEditingController();
  final _controllerAge = TextEditingController();
  final _controllerRole = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerAge.dispose();
    _controllerRole.dispose();
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim());

    addUserDetails(
      _controllerFirstName.text.trim(),
      _controllerLastName.text.trim(),
      _controllerEmail.text.trim(),
      int.parse(_controllerAge.text.trim()),
      _controllerRole.text

    );
  }

  Future addUserDetails (
      String firstName, String lastName, String email, int age, String role) async {
    await FirebaseFirestore.instance.collection('users').add({
      "first name": firstName,
      'last name': lastName,
      'email': email,
      'age': age,
      'role': role
    });
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
              Text('Bogey Management Register Page',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
              SizedBox(height: 10),
              Text('Register bellow',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              SizedBox(height: 10),
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
              //first name

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _controllerFirstName,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  first name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //last name

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _controllerLastName,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  last name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //age

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _controllerAge,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  age',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //register
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'sign up',
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

              //role

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _controllerRole,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  enter caddie or member',
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
                    onTap: widget.showLoginPage,
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
