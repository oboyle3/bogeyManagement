import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:golf_management_app/main.dart';
import 'package:golf_management_app/resuable_widgets/navigation_drawer_widget.dart';

import '../start_pages/getusername.dart';
//import 'package:golf_management_app/screens/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),

          appBar: AppBar(
        title: Text(" Main Page for Caddies"),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              // display user profile picture here
              radius: 50,
            ),
            SizedBox(height: 16),
            GetUserName(documentID: "yMjVYMUzAiY7xAe6y5QJ"),
            // display other user details here
          ],
          /*children: [
        Text('signed in as   ' + user.email!),
        MaterialButton(onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        color: Colors.deepPurple,
        child: Text('sign out'),
        ),
      ],*/
      ),
      )
    );
}












/*
class _HomeScreenState extends State<HomeScreen> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(122, 46, 20, 159),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(text: 'profile', icon: Icons.people),
            buildMenuItem(text: 'history', icon: Icons.add_chart),
            buildMenuItem(text: 'schedule', icon: Icons.schedule_sharp),
            buildMenuItem(text: 'rules', icon: Icons.golf_course_outlined),
            buildMenuItem(text: 'logout', icon: Icons.logout),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            const SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: () {},
  );
}


*/
 
/*
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("logout"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()));
          },
        ),
      ),
    );
  }
}
*/