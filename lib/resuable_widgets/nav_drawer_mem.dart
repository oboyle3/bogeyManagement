import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:golf_management_app/member_Pages/profilePageMember.dart';

import '../member_Pages/history_page_member.dart';
import '../member_Pages/rulesPageMember.dart';

class NavigationDrawerWidgetMember extends StatelessWidget {
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
              icon:  Icons.add_chart,
              onClicked: () => selectedItem(context,1)
            ),
            buildMenuItem(
              text: 'rules',
              icon: Icons.golf_course_outlined,
              onClicked: () => selectedItem(context,2)
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
        builder: (context) => ProfilePageMember(),
      ));
      break;
    case 1: 
      
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HistoryPageMember(),
      ));
      break;
    case 2: 
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RulesPageMember(),//
      ));
      break;
    case 3: 
     
      
      
  }

}