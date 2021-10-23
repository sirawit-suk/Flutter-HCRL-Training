import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meme_app/home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Register/Login')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: "Email", hintText: "Insert your email here"),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                    print(_email);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Insert your password here"),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                    print(_password);
                  });
                },
              ),
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    print("Register Complete");
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } on FirebaseAuthException catch (e) {
                    print(e.message);
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text("Register", style: TextStyle(fontSize: 18))),
            ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    print("Login Complete");
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } on FirebaseAuthException catch (e) {
                    print(e.message);
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text("Login", style: TextStyle(fontSize: 18)))
          ],
        ));
  }
}
