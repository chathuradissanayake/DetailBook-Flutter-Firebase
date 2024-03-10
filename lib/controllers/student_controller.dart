import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp05_firebase/models/student_model.dart';

final CollectionReference _students =
    FirebaseFirestore.instance.collection("students");

class student_controller {
  // add data to firebase
  Future add_student(student_model student) async {
    await _students.doc().set(student.add_data());
  }

  //update
  Future update_student(student_model student) async {
    await _students.doc(student.id).update(student.add_data());
  }

  //delete
  Future delete_student(student_model student) async {
    await _students.doc(student.id).delete();
  }
}
