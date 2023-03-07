import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:golf_management_app/start_pages/auth.dart';

class HomeP extends StatelessWidget {
  HomeP({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('firebase auth');
  }

  Widget _UserUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _SignOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('sign out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _UserUid(),
                _SignOutButton(),
              ],
            )));
  }
}
