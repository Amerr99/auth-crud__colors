import 'package:flutter/material.dart';

class Green extends StatefulWidget {
  const Green({super.key});

  @override
  State<Green> createState() => _GreenState();
}

class _GreenState extends State<Green> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }
}