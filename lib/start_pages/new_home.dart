import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'getusername.dart';



class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late String myEmail;
  final user = FirebaseAuth.instance.currentUser!;

  //get docids
  List<String> docIDs = [];     
  
  
  //works
  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        
        .then((snapshot) => snapshot.docs.forEach((document) {
              //print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }
  //works
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(
        title: Text( user.email!,
        style: TextStyle(fontSize: 18)
        ),
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout)),
        ],
      ),
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          color: Colors.deepPurple,
          child: Text('sign out'),
        ),
        
        //works
        Expanded(
            child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        //title: Text(docIDs[index]),
                        title: GetUserName(documentID: docIDs[index]),
                      );
                    },
                  );
                }
              )
            )
          //works
        
       

      ],
    )));
  }

}

