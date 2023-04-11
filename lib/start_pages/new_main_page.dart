import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:golf_management_app/caddie_Pages/home_screen.dart';
import 'package:golf_management_app/member_Pages/home_screen_member.dart';

import '../resuable_widgets/chooseRolePage.dart';
import 'new_auth.dart';
import 'new_home.dart';
import 'new_login.dart';

class NewMainPage extends StatelessWidget {
  const NewMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final User? user = snapshot.data;
            final String uid = user?.uid ?? '';
            final DocumentReference userRef =
                FirebaseFirestore.instance.collection('users').doc(uid);
            return FutureBuilder<DocumentSnapshot>(
              future: userRef.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final Map<String, dynamic>? data = snapshot.data?.data() as Map<String, dynamic>?;
                  if (data != null && data.containsKey('role') && data['role'] == 'caddie') {
                    return NewHomePage();
                  }
                }
                return Container();
              },
            );
          } else {
            return const NewAuthPage();
          }
        },
      ),
    );
  }
}




/*
class NewMainPage extends StatelessWidget {
  const NewMainPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        
        builder: (context, snapshot) {
          if(snapshot.hasData ){
            
            return  const NewHomePage();//removing const
          } else{
            return const NewAuthPage();
          }
        },
      ),

      );
    
  }
}
*/