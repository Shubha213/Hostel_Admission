import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WingAllot extends StatefulWidget {
  const WingAllot({Key? key}) : super(key: key);

  @override
  State<WingAllot> createState() => _WingAllotState();
}

class _WingAllotState extends State<WingAllot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF90294A),
        title: Text('Wing Allot')),
    );
  }
}