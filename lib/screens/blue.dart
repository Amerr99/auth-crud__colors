import 'package:colors/screens/read.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Blue extends StatefulWidget {
  const Blue({super.key});

  @override
  State<Blue> createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  String? type;
  Future<void> _update([DocumentSnapshot? myRow]) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection("users");
    final String usertype = type.toString();
    await users.doc(myRow!.id).update({"type": usertype});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue,
            child: ListView(children: [
              Container(),
              RadioListTile(
                title: Text(
                  "Admin",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                activeColor: Colors.red,
                tileColor: Colors.amber,
                value: "admin",
                groupValue: type,
                onChanged: (value) {
                  setState(() {
                    type = value.toString();
                  });
                },
              ),
              RadioListTile(
                  activeColor: Colors.red,
                  title: Text(
                    "User",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  tileColor: Colors.amber,
                  value: "user",
                  groupValue: type,
                  onChanged: (value) {
                    setState(
                      () {
                        type = value.toString();
                      },
                    );
                  }),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    // _update(myRow);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ));
                  },
                  child: Text("go to data"))
            ])));
  }
}
