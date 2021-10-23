import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meme_app/auth_page.dart';

class HomePage extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Home", style: TextStyle(fontSize: 20)),
          ElevatedButton(
              onPressed: () {
                try {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AuthPage()));
                } on FirebaseAuthException catch (e) {
                  print(e);
                }
              },
              child: const Text(
                "Sign Out",
                style: TextStyle(fontSize: 20),
              ))
        ]),
      ),
    );
  }
}
