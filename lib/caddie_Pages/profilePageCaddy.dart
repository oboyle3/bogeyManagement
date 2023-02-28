import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage("https://example.com/user/avatar.png"),
            ),
            SizedBox(height: 16.0),
            Text("User Name", style: TextStyle(fontSize: 24.0)),
            Text("user@example.com", style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 16.0),
            Text("About Me", style: TextStyle(fontSize: 20.0)),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          ],
        ),
      ),
        // User profile content here
  );
}
