import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:golf_management_app/caddie_Pages/home_screen.dart';
import 'package:golf_management_app/start_pages/auth.dart';
import 'package:golf_management_app/start_pages/test.dart';
//import 'package:golf_management_app/start_pages/login_register_page.dart';

//import 'homep.dart';
import 'new_auth.dart';
import 'new_home.dart';
//import 'new_home.dart';

class WidgetTree extends StatefulWidget {
  WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  NewHomePage();
          //return TestPage();
          //return HomeScreen();
        } else {
          return const NewAuthPage(); //should have const
        }
      },
    );
  }
}
