import 'package:colors/firebase_options.dart';
import 'package:colors/screens/blue.dart';
import 'package:colors/screens/green.dart';
import 'package:colors/screens/login.dart';
import 'package:colors/screens/mix.dart';
import 'package:colors/screens/read.dart';
import 'package:colors/screens/red.dart';
import 'package:colors/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(routes: {
    "read": (context) => const Home(),
    "mix": (context) => const Mix(),
    "green": (context) => const Green(),
    "blue": (context) => const Blue(),
    "red": (context) => const Red(),
    "log-in": (context) => const Login(),
  }, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Blue();
  }
}
