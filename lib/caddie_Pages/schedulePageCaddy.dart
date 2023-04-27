import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';


class schedulePageCaddy extends StatelessWidget {
//
 




@override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> weekdays = List.generate(
      7,
      (index) => DateFormat('EEEE').format(now.add(Duration(days: index))),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Caddy Schedule'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 84, 76, 175),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Please set your availability for this week below:',
            style: TextStyle(fontSize: 14),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: weekdays.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      weekdays[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle "AM" button press
                          },
                          child: Text('AM'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "PM" button press
                          },
                          child: Text('PM'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

