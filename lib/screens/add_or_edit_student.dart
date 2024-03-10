import 'package:flutter/material.dart';
import 'package:myapp05_firebase/components/mytextfield.dart';
import 'package:myapp05_firebase/controllers/student_controller.dart';
import 'package:myapp05_firebase/models/student_model.dart';

class ManageStudent extends StatefulWidget {
  final student_model? student;
  final index;

  ManageStudent({this.student, this.index});

  @override
  State<ManageStudent> createState() => _ManageStudentState();
}

class _ManageStudentState extends State<ManageStudent> {
  final _form_key = GlobalKey<FormState>();

  bool iseditingmode = false;
  final TextEditingController id = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController number = TextEditingController();

  @override
  void initState() {
    if (widget.index != null) {
      iseditingmode = true;

      id.text = widget.student?.id;
      fname.text = widget.student?.fname;
      lname.text = widget.student?.lname;
      email.text = widget.student?.email;
      number.text = widget.student?.number;
    } else {
      iseditingmode = false;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: iseditingmode == true
            ? Text("EDIT STUDENT")
            : Text(
                "ADD STUDENT",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
              child: iseditingmode == true
                  ? const Text(
                      "EDIT STUDENT",
                      style: TextStyle(fontSize: 22),
                    )
                  : const Text(
                      "ADD STUDENT",
                      style: TextStyle(fontSize: 22),
                    )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
                key: _form_key,
                child: Column(
                  children: [
                    MytextField(
                      hintedtext: "Enter Your First Name",
                      labeledtext: "First Name",
                      mycontroller: fname,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MytextField(
                      hintedtext: "Enter Your Last Name",
                      labeledtext: "Last Name",
                      mycontroller: lname,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MytextField(
                      hintedtext: "Enter Your Email",
                      labeledtext: "Email",
                      mycontroller: email,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MytextField(
                      hintedtext: "Enter your Contact Number",
                      labeledtext: "Contact Number",
                      mycontroller: number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () {
                if (_form_key.currentState!.validate()) {
                  //_form_key.currentState!.save();

                  if (iseditingmode == true) {
                    student_controller().update_student(student_model(
                        id: id.text,
                        fname: fname.text,
                        lname: lname.text,
                        email: email.text,
                        number: number.text));
                  } else {
                    student_controller().add_student(student_model(
                        fname: fname.text,
                        lname: lname.text,
                        email: email.text,
                        number: number.text));
                  }
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set the background color to blue
              ),
              child: iseditingmode == true
                  ? Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ))
        ],
      ))),
    );
  }
}
