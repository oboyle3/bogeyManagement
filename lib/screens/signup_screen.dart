import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:golf_management_app/screens/choose_role.dart';
import '../resuable_widgets/reusable_widget.dart';
import '../utils/colors_utils.dart';
import '../caddie_Pages/home_screen.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController _passwordTextController = TextEditingController();
TextEditingController _emailTextController = TextEditingController();
TextEditingController _userNameTextController = TextEditingController();



class _SignUpScreenState extends State<SignUpScreen> {
  bool isCaddieChecked = false;
  bool isMemberChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("sign up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
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
                  child: Column(
                    
                    children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("user", Icons.person_outline, false,
                        _userNameTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField("pass", Icons.lock_outline, false,
                        _passwordTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField("email", Icons.beach_access, false,
                        _emailTextController),
                   
                    
                    signInSignUpButton(context, false, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseRoleScreen()));
                    }),
                    
                   
                  ])
                  
                  ))
                  ),
    );
  }
  //

  //
}
