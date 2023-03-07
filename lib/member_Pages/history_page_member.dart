import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class HistoryPageMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('EEEE, MMMM d');

    return Scaffold(
      appBar: AppBar(
        title: Text('schedule'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatter.format(DateTime.now()),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // add your code here
              },
              child: Text('Button 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // add your code here
              },
              child: Text('Button 2'),
            ),
          ],
        ),
      ),
    );
  }
}
      

/* child: Text(
          formatter.format(DateTime.now()),
        ), */