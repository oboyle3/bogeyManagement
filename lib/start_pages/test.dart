import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String _userName = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  Future<void> _getUserName() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      final DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      final Map<String, dynamic>? data = querySnapshot.data();
      if (data != null) {
        setState(() {
          _userName = data['first name'] ?? 'User name not found';
        });
      } else {
        setState(() {
          _userName = 'User not found';
        });
      }
    } catch (e) {
      print('Error retrieving user name: $e');
      setState(() {
        _userName = 'Error retrieving user name';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: Text('Welcome, $_userName'),
      ),
    );
  }
}
