import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CaddiedHistory {
  final DateTime date;
  final String time;
  final String player;
  CaddiedHistory(
      {required this.date, required this.time, required this.player});
}
//
List<CaddiedHistory> caddiedHistory = [
  CaddiedHistory(date: DateTime(2023, 2, 21), time: '8:00am', player: 'George Grevera'),
  CaddiedHistory(date: DateTime(2023, 2, 21), time: '10:30am', player: 'Wei Chang'),
  CaddiedHistory(date: DateTime(2023, 2, 22), time: '9:15am', player: 'Ola Ajaj'),
  
];
//

class historyPageCaddy extends StatelessWidget {
  final List<CaddiedHistory> history;
  historyPageCaddy({required this.history});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caddied History'),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text('Player: ${history[index].player}'),
              subtitle: Text('Date: ${history[index].date}, Time: ${history[index].time}'),
            ),
          );
        },
      ),
    );
  }
}

/*
class historyPageCaddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('caddy history'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            SizedBox(height: 25), // add some space between app bar and text
            Text(
              'your past caddy assignments for this season are shown below ',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      );
}
*/