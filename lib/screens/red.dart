import 'package:flutter/material.dart';

class Red extends StatefulWidget {
  const Red({super.key});

  @override
  State<Red> createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.red,
    ));
  }
}
