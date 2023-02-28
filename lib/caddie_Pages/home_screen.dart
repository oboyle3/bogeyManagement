import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:golf_management_app/main.dart';
import 'package:golf_management_app/resuable_widgets/navigation_drawer_widget.dart';
import 'package:golf_management_app/screens/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),

          appBar: AppBar(
        title: Text("Bogey Management Main Page"),
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