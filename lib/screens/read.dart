import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  Future<void> _create([DocumentSnapshot? myRow]) async {
    if (myRow != null) {
      idController.text = myRow['id'].toString();

      nameController.text = myRow['name'];
      typeController.text = myRow['type'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: typeController,
                  decoration: const InputDecoration(labelText: 'Type'),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'ID',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () async {
                    final String type = typeController.text;
                    final String name = nameController.text;
                    final double? id = double.tryParse(idController.text);
                    if (id != null) {
                      await users.add({"name": name, "id": id, "type": type});
                      nameController.text = '';
                      idController.text = '';
                      typeController.text = '';
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String usersId) async {
    await users.doc(usersId).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Product Deleted"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(),
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot myRow = streamSnapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(myRow['name']),
                    subtitle: Text(myRow['id'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(children: [
                        Text(myRow['type']),
                        // IconButton(
                        //   onPressed: () {
                        //     _update(myRow);
                        //   },
                        //   icon: Icon(Icons.edit),
                        // ),
                        IconButton(
                          onPressed: () {
                            _delete(myRow.id);
                          },
                          icon: Icon(Icons.delete),
                        )
                      ]),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text("you have no data"),
          );
        },
      ),
    );
  }
}
