import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class rulesPageCaddy extends StatefulWidget {
  @override
  _rulesPageCaddyState createState() => _rulesPageCaddyState();
}

class _rulesPageCaddyState extends State<rulesPageCaddy> {
  List<String> dates = [];

  @override
  void initState() {
    super.initState();
    getDates();
  }

  Future<void> getDates() async {
    final userRef = FirebaseFirestore.instance.collection("users").doc("yMjVYMUzAiY7xAe6y5QJ");
    final doc = await userRef.get();
    if (doc.exists) {
      setState(() {
        dates = List.from(doc.data()!["date"]);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(  
      title: Text('caddy rules'),
      centerTitle:true,
      backgroundColor: Colors.green,
    ),
    body: Column(
        children: [
          SizedBox(height: 25), // add some space between app bar and text
          Text(
            'Review the rules at your club',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            '1. Be on time.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '2. Be respectful.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '3. Keep the bag organized.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '4. Have Fun!',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 25), // add some space between the rules and the dates
          if (dates.isNotEmpty)
            Text(
              'Your next Loop:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          for (String date in dates)
            Text(
              '- $date',
              style: TextStyle(fontSize: 14),
            ),
        ],
      ),
  );
}
