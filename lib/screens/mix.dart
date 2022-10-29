import 'package:flutter/material.dart';

class Mix extends StatefulWidget {
  const Mix({super.key});

  @override
  State<Mix> createState() => _MixState();
}

class _MixState extends State<Mix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.blue, Colors.green])),
      ),
    );
  }
}
