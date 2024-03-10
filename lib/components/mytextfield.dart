// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  final labeledtext, hintedtext;
  final TextEditingController mycontroller;

  const MytextField(
      {required this.labeledtext,
      required this.hintedtext,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return "the $labeledtext is required";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: labeledtext,
          hintText: hintedtext,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.red))),
    );
  }
}
