import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(child: Text("login")),
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
                try {
                  var authin = FirebaseAuth.instance;
                  UserCredential user = await authin.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  if (authin.currentUser!.email == ("red@gmail.com")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Logged in")));
                    Navigator.pushNamed(context, "red");
                  } else if (authin.currentUser!.email == ("blue@gmail.com")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("logged in blue")));
                    Navigator.pushNamed(context, "blue");
                  } else if (authin.currentUser!.email == ("green@gmail.com")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("logged in green")));
                    Navigator.pushNamed(context, "green");
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("logged in mix")));
                    Navigator.pushNamed(context, "mix");
                  }
                } catch (e) {
                  if (email.text.isEmpty && password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please Enter Your Email and password "),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sorry Invalid Email Or Password"),
                      ),
                    );
                  }
                }
              },
              child: Text("log-in"))
        ],
      ),
    );
  }
}
