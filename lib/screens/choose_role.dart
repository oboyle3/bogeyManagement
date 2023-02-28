import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:golf_management_app/caddie_Pages/home_screen.dart';
import 'package:golf_management_app/member_Pages/home_screen_member.dart';

import '../utils/colors_utils.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
 bool isCaddieChecked = false;
 bool isMemberChecked = false;
  void _onCaddieChecked(bool value) {
    setState(() {
      isCaddieChecked = value;
      if (isCaddieChecked) {
        isMemberChecked = false;
      }
    });
  }

  void _onMemberChecked(bool value) {
    setState(() {
      isMemberChecked = value;
      if (isMemberChecked) {
        isCaddieChecked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership'),
      ),
      body: Container(
         width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("#6942f5"),
            hexStringToColor("#4296f5"),
            hexStringToColor("#42c5f5")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

      
      child :Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: Text('Caddie'),
              value: isCaddieChecked,
              onChanged: ( value) {
                setState(() {
                  isCaddieChecked = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Member'),
              value: isMemberChecked,
              onChanged: (value) {
                setState(() {
                  isMemberChecked = value ?? false;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Next'),
              onPressed: () {
                if (isCaddieChecked) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else if (isMemberChecked) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreenMember()),
                  );
                } else {
                  // Display an error message or do nothing.
                }
              },
            ),
          ],
        ),
      ),
      )

      );
    
  }
}
/*body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("#6942f5"),
            hexStringToColor("#4296f5"),
            hexStringToColor("#42c5f5")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),*/ 