import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'new_auth.dart';
import 'new_home.dart';
import 'new_login.dart';

class NewMainPage extends StatelessWidget {
  const NewMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const NewHomePage();
          } else{
            return const NewAuthPage();
          }
        },
      ),

      );
    
  }
}