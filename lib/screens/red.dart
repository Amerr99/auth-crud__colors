import 'package:colors/screens/read.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Red extends StatefulWidget {
  Red(this.color, {super.key});
  Color color;

  @override
  State<Red> createState() => _RedState();
}

class _RedState extends State<Red> {
  String? type;

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
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
        color: widget.color,
        child: StreamBuilder(
          stream: users.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final DocumentSnapshot myRow =
                      streamSnapshot.data!.docs[index];
                  return Column(
                    children: [
                      RadioListTile(
                        title: Text(
                          "Admin",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        activeColor: Colors.blue,
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
                          activeColor: Colors.blue,
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
                            _update(myRow);

                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ));
                          },
                          child: Text("go to data"))
                    ],
                  );
                },
              );
            }
            return Center(
              child: Text("you have no data"),
            );
          },
        ),
      ),
    );
  }
}
