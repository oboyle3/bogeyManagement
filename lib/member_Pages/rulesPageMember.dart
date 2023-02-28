import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RulesPageMember extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(  
      title: Text('member rules'),
      centerTitle:true,
      backgroundColor: Color.fromARGB(255, 76, 78, 175),
    ),
    body: Column(
        children: [
          SizedBox(height: 25), // add some space between app bar and text
          Text(
            'Review the rules at your club and the PGA',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
  );
}

/*
class rulesPageCaddy extends StatelessWidget {
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
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
  );
}
*/