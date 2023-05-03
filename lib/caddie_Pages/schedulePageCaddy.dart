import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
//
void updateUserData() {
  final currentUser = FirebaseAuth.instance.currentUser!;
  
  final userRef = FirebaseFirestore.instance.collection("users").doc("yMjVYMUzAiY7xAe6y5QJ"); 


  // Get the current user's data
  userRef.get().then((doc) {
    if (doc.exists) {
      
      List<String> availability = List.from(doc.data()!["date"]);
      DateTime nextDay = DateTime.now().add(Duration(days: 1));
      String nextDayStr = DateFormat('EEEE').format(nextDay);
      availability.add(nextDayStr);
      userRef.update({"date": availability});
    } else {
      
      List<String> availability = [DateFormat('EEEE').format(DateTime.now().add(Duration(days: 1)))];
      userRef.set({"date": availability});
    }
  });
}


//

class schedulePageCaddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().add(Duration(days: 1));
    List<String> weekdays = List.generate(
      1,
      (index) => DateFormat('EEEE').format(now),
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
                          updateUserData();
                          },
                        child: Text('Yes, available'),
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
