import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/screens/Rooms_Screen.dart';
import 'package:hostel_app/screens/Wing_Allot.dart';
// import 'package:hostel_app/screens/admin_screen.dart';
import 'package:hostel_app/screens/details_screen.dart';
import 'package:hostel_app/screens/user_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Userscreen(),
    );
  }
}
