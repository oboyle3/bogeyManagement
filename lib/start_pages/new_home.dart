import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../caddie_Pages/home_screen.dart';
import '../member_Pages/home_screen_member.dart';
import 'getusername.dart';
/*
final userRef = FirebaseFirestore.instance.collection('users');

//class NewHomePage extends StatefulWidget {
  //const NewHomePage({super.key});

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late String myEmail;
  final user = FirebaseAuth.instance.currentUser!;

  //get docids
  List<String> docIDs = [];     
  
  
  //works
  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        
        .then((snapshot) => snapshot.docs.forEach((document) {
              //print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }
  //works
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(
        title: Text( user.email!,
        style: TextStyle(fontSize: 18)
        ),
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout)),
        ],
      ),
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          color: Colors.deepPurple,
          child: Text('sign out'),
        ),
        
        //works
        Expanded(
            child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        //title: Text(docIDs[index]),
                        title: GetUserName(documentID: docIDs[0]),
                      );
                    },
                  );
                }
              )
            )
          //works
        
       

      ],
    )));
  }

}


*/
//nownownownow nwodwight
/*
final userRef = FirebaseFirestore.instance.collection('users');

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late String myEmail;
  final user = FirebaseAuth.instance.currentUser!;

  //get docids
  List<String> docIDs = [];

  //get docIDs
  Future<void> getDocId() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();

    setState(() {
      docIDs = snapshot.docs.map((doc) => doc.id).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    print(FirebaseAuth.instance.currentUser!.email);
    getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //user.email!,
          FirebaseAuth.instance.currentUser!.email!,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (docIDs.isNotEmpty)
              GetUserName(documentID: docIDs.last)
            else
              const Text('No user found'),
          ],
        ),
      ),
    );
  }
}

class GetUserName extends StatelessWidget {
  final String documentID;

  const GetUserName({required this.documentID});

  @override
  Widget build(BuildContext context) {
    final userRef = FirebaseFirestore.instance.collection('users').doc(documentID);

    return FutureBuilder<DocumentSnapshot>(
      future: userRef.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            final firstName = data['first name'];
            final lastName = data['last name'];
            final role = data['role'];

            return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text("Hello "+'$firstName $lastName',
         style: TextStyle(fontSize: 20)),
    Text("you are a "+role,
         style: TextStyle(fontSize: 20)),
  ],
);
          } else {
            return const Text('No data found');
          }
        } else {
          return const Text('Loading...');
        }
      },
    );
  }
}
*///end
final userRef = FirebaseFirestore.instance.collection('users');
class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late String myEmail;
  final user = FirebaseAuth.instance.currentUser!;

  //get docids
  List<String> docIDs = [];

  //get docIDs
  Future<void> getDocId() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();

    setState(() {
      docIDs = snapshot.docs.map((doc) => doc.id).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    print(FirebaseAuth.instance.currentUser!.email);
    getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //user.email!,
          FirebaseAuth.instance.currentUser!.email!,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (docIDs.isNotEmpty)
              GetUserName(documentID: docIDs.last),
            SizedBox(height: 20),
            if (docIDs.isNotEmpty) // conditionally render buttons based on whether docIDs is empty or not
              FutureBuilder<DocumentSnapshot>(
                future: userRef.doc(docIDs.last).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data != null) {
                      final data = snapshot.data!.data() as Map<String, dynamic>;
                      final role = data['role'];

                      return Column(
                        children: [
                          if (role == 'caddie')
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Text('Go to HomeScreen'),
                            ),
                          if (role == 'member')
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreenMember(),
                                  ),
                                );
                              },
                              child: Text('Go to HomeScreenMember'),
                            ),
                        ],
                      );
                    } else {
                      return const Text('No data found');
                    }
                  } else {
                    return const Text('Loading...');
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
