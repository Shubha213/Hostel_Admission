import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class user_form_screen extends StatefulWidget {
  const user_form_screen({Key? key}) : super(key: key);

  @override
  State<user_form_screen> createState() => user_form_screenState();
}

class user_form_screenState extends State<user_form_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF90294A),
        title: const Text("Admission Form")),
    );
  }
}