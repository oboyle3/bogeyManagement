import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryPageMember extends StatefulWidget {
  const HistoryPageMember({super.key});

  @override
  State<HistoryPageMember> createState() => _HistoryPageMemberState();
}

class _HistoryPageMemberState extends State<HistoryPageMember> {
 @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(  
      title: Text('member history'),
      centerTitle:true,
      backgroundColor: Colors.green,
    ),
    body: Container(
      padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(height: 16.0),
            Text("history page", style: TextStyle(fontSize: 24.0)),
            
          ],
        ),
      ),
        // User profile content here
  );
}