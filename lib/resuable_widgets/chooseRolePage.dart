import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../caddie_Pages/home_screen.dart';
import '../member_Pages/home_screen_member.dart';
//import 'HomeScreen.dart';
//import 'HomeScreenMember.dart';
//NEW NEW NEW 
class ChooseRolePage extends StatefulWidget {
   const ChooseRolePage({super.key});

 @override
  State<ChooseRolePage> createState() => _NewChooseRolePage();
}
class _NewChooseRolePage extends State<ChooseRolePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('signed in as   ' + user.email!),
        MaterialButton(onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        color: Color.fromARGB(255, 17, 63, 32),
        child: Text('sign out'),
        ),
        ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Caddie'),
              //color: Colors.blue,
            ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreenMember()),
                );
              },
              child: Text('member'),
              //color: Colors.blue,
            ),
        
      ],
      
      
    )));
  }
}







/*
class ChooseRolePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const HomeScreen()),
                );
              },
              child: Text(
                'Caddie',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const HomeScreenMember()),
                );
              },
              child: Text(
                'Member',
                style: TextStyle(fontSize: 20),
              ),
               
               
            ),
            
            
              
                
              
               
               
            
            
            //
          
            



          ],
        ),
      ),
    );
  }
}
*/