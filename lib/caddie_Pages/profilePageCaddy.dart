import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../start_pages/getusername.dart';

class profilePageCaddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(  
      title: Text('caddy profile'),
      centerTitle:true,
      backgroundColor: Colors.green,
    ),
    body: Container(
      padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Icon(Icons.person_pin_circle_sharp , size: 39.0),
            SizedBox(height: 16.0),
            Text(FirebaseAuth.instance.currentUser!.email!, style: TextStyle(fontSize: 24.0)),
            /*
               title: Text(
          //user.email!,
          FirebaseAuth.instance.currentUser!.email!,
          style: const TextStyle(fontSize: 18),
        ),
            */
            //Text("user@example.com", style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 16.0),
            Text("About Me", style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 16),
            GetUserName(documentID: "yMjVYMUzAiY7xAe6y5QJ"),
            //Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          ],
        ),
      ),
        // User profile content here
  );
}
