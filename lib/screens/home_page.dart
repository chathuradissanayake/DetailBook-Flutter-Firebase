import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp05_firebase/controllers/student_controller.dart';
import 'package:myapp05_firebase/models/student_model.dart';
import 'package:myapp05_firebase/screens/add_or_edit_student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _student =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ManageStudent())));
        },
        child: Icon(Icons.person_add_alt_outlined),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.red,
        title: const Text(
          "STUDENT DETAILS",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            height: 700,
            child: StreamBuilder(
              stream: _student.snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                }
                if (snapshots.hasData) {
                  return ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final DocumentSnapshot records =
                          snapshots.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Slidable(
                          startActionPane:
                              ActionPane(motion: StretchMotion(), children: [
                            SlidableAction(
                              onPressed: (context) {
                                final student = student_model(
                                  id: records.id,
                                  fname: records["fname"],
                                  lname: records["lname"],
                                  email: records["email"],
                                  number: records["number"],
                                );

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => ManageStudent(
                                              student: student,
                                              index: index,
                                            ))));
                              },
                              icon: Icons.edit_note,
                              backgroundColor: Colors.blue,
                            )
                          ]),
                          endActionPane:
                              ActionPane(motion: StretchMotion(), children: [
                            SlidableAction(
                              onPressed: (context) {
                                student_controller().delete_student(
                                    student_model(id: records.id));
                              },
                              icon: Icons.delete_outline,
                              backgroundColor: Colors.red,
                            )
                          ]),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors
                                    .purple, // Set the border color to red
                              ),
                              borderRadius: BorderRadius.circular(
                                  8), // You can adjust the border radius as needed
                            ),
                            child: ListTile(
                              tileColor: Color.fromARGB(255, 166, 239, 249),
                              title: Text(
                                "${records["fname"]} ${records["lname"]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email: ${records["email"]}"),
                                  Text("Mobile: ${records["number"]}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {}

                return Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              },
            ),
          )
        ],
      ))),
    );
  }
}
