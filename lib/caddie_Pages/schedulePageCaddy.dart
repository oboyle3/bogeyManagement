import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';


class schedulePageCaddy extends StatelessWidget {
//
 





  @override
  Widget build(BuildContext context) => Scaffold(
    //DateTime now = DateTime.now();
    //String formattedDate = DateFormat('EEEE, MMM d').format(now),
      appBar: AppBar(
        title: Text('caddy schedule'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 84, 76, 175),
      ),
      body: Form(
        child: Column(
          children: [
            SizedBox(height: 25), // add some space between app bar and text
            Text(
              'please set your avaliblity for next week below',
              style: TextStyle(fontSize: 14),
            ),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text('AM'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('PM'),
            ),
          ],
        ),


      ));
}
