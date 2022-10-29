import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(child: Text("welcome")),
          TextField(
            controller: email,
            decoration: InputDecoration(label: Text("Email")),
          ),
          TextField(
            obscureText: true,
            controller: password,
            decoration: InputDecoration(label: Text("Password")),
          ),
          ElevatedButton(
              onPressed: () async {
                UserCredential user = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("user created")));
                Navigator.pushNamed(context, "log-in");
              },
              child: Text("sign-up"))
        ],
      ),
    );
  }
}
