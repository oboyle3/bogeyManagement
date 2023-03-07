//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golf_management_app/screens/signup_screen.dart';
import 'package:golf_management_app/utils/colors_utils.dart';

import '../resuable_widgets/reusable_widget.dart';
import '../caddie_Pages/home_screen.dart';

class SignInScreen extends StatefulWidget {
  //const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

//TextEditingController _passwordTextController = TextEditingController();
//TextEditingController _emailTextController = TextEditingController();
//String _email, _password;
class _SignInScreenState extends State<SignInScreen> {
  String email='', password='';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("#6942f5"),
          hexStringToColor("#4296f5"),
          hexStringToColor("#42c5f5")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'email'),
                      onChanged: (value) {
                        setState(() {
                          email = value.trim();
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'pass'),
                    onChanged: (value) {
                      setState(() {
                        password = value.trim();
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        child: const Text('sighn in'),
                        onPressed: () {
                          auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => (const HomeScreen())));
                        }),
                    ElevatedButton(
                        child: const Text('sighn UP'),
                        onPressed: () {
                          auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                              Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => (HomeScreen())));
                        }),
                  ],
                )
              ]
                  /*
               <Widget>[
                //logoWidget('assets/images/BM.png'),
                SizedBox(
                  height: 30,
                ),
                reusableTextField(
                    "user", Icons.person_outline, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "pass", Icons.lock_outline, false, _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  
                }),
                signUpOption()
              ],
              */
                  )),
        ),
      ),
    );
  } ///////

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("dnt have a account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
