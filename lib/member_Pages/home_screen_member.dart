import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resuable_widgets/nav_drawer_mem.dart';

class HomeScreenMember extends StatefulWidget {
  const HomeScreenMember({super.key});

  @override
  State<HomeScreenMember> createState() => _HomeScreenMemberState();
}

class _HomeScreenMemberState extends State<HomeScreenMember> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidgetMember(),

          appBar: AppBar(
        title: Text("Bogey Management for Members"),
      )
    );
}