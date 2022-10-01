import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class user_room_screen extends StatefulWidget {
  const user_room_screen({Key? key}) : super(key: key);

  @override
  State<user_room_screen> createState() => user_room_screenState();
}

class user_room_screenState extends State<user_room_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF90294A),
          title: const Text('Room Details'),),
    );
  }
}