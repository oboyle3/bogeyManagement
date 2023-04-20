import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentID;

  GetUserName({required this.documentID});

  @override
  Widget build(BuildContext context) {
    //get collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
  future:users.doc(documentID).get(),
  builder: ((context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData && snapshot.data != null) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text(' ${data["first name"]}' +' ${data["last name"]}' + ' ${data["role"]}'  );
        
      } else {
        return Text('no data found');
      }
    } else {
      return Text('loading...');
    }
  }),
);

    
  }



  //
  //



}


//  Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
