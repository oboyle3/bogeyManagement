import 'package:flutter/material.dart';

import '../caddie_Pages/historyPageCaddy.dart';
import '../caddie_Pages/profilePageCaddy.dart';
import '../caddie_Pages/rulesPageCaddy.dart';
import '../caddie_Pages/schedulePageCaddy.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final Padding = EdgeInsets.symmetric(horizontal: 20);
  
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: Material(  
        color: Color.fromRGBO(118, 33, 202, 1),
        child: ListView(  
          padding:Padding,
          children: <Widget>[  
            const SizedBox(height:48),
            buildMenuItem(  
              text: 'profile',
               icon: Icons.people,
               onClicked: () => selectedItem(context,0)
            ),
            buildMenuItem(
              text: 'history',
              icon: Icons.add_chart,
              onClicked: () => selectedItem(context,1)
            ),
            buildMenuItem(
              text: 'schedule',
              icon: Icons.schedule_sharp,
              onClicked: () => selectedItem(context,2)
            ),
            buildMenuItem(
              text: 'rules',
              icon: Icons.golf_course_outlined,
              onClicked: () => selectedItem(context,3)
            ),
            buildMenuItem(
              text: 'logout',
              icon: Icons.logout,
              onClicked: () => selectedItem(context,4)
            ),
               const SizedBox(height: 25),
               Divider(color: Color.fromARGB(255, 255, 255, 255)),
               const SizedBox(height: 25) 
          ]
        )
      )
    );
  }
}
Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
void selectedItem(BuildContext context,int index){
  switch (index){
    case 0: 
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => profilePageCaddy(),
      ));
      break;
    case 1: 
      
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => historyPageCaddy(history: caddiedHistory),
      ));
      break;
    case 2: 
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => schedulePageCaddy(),//
      ));
      break;
    case 3: 
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => rulesPageCaddy(),//
      ));
      break;
    case 4: 
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => rulesPageCaddy(),//
      ));
      break;
      
      
  }

}