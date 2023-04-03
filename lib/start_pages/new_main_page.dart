import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:golf_management_app/caddie_Pages/home_screen.dart';
import 'package:golf_management_app/member_Pages/home_screen_member.dart';

import 'chooseRolePage.dart';
import 'new_auth.dart';
import 'new_home.dart';
import 'new_login.dart';



//copt of oringnal undeer import

class NewMainPage extends StatelessWidget {
  const NewMainPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        
        builder: (context, snapshot) {
          if(snapshot.hasData){//snapshot.data['role'] == 'caddie'
            
            return  NewHomePage();//removing const
          } else{
            return const NewAuthPage();
          }
        },
      ),

      );
    
  }
}

/*builder: (context, snapshot) {
          if(snapshot.hasData){//snapshot.data['role'] == 'caddie'
            return const NewHomePage();
          } else{
            return const NewAuthPage();
          }
        },*/ 