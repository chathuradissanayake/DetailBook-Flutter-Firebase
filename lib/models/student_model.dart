class student_model {
  final id, fname, lname, email, number;
  student_model({this.id, this.fname, this.lname, this.email, this.number});

//map data to firebase

  Map<String, dynamic> add_data() {
    return {"fname": fname, "lname": lname, "email": email, "number": number};
  }
}
