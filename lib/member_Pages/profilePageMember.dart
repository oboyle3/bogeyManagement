import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilePageMember extends StatefulWidget {
  const ProfilePageMember({super.key});

  @override
  State<ProfilePageMember> createState() => _ProfilePageMemberState();
}

class _ProfilePageMemberState extends State<ProfilePageMember> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(  
      title: Text('member profile'),
      centerTitle:true,
      backgroundColor: Colors.green,
    ),
    body: Container(
      padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 16.0),
            Text("User Name", style: TextStyle(fontSize: 24.0)),
            
          ],
        ),
      ),
        // User profile content here
  );
}