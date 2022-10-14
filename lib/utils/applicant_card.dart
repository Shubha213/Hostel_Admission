import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ApplicantCard extends StatelessWidget {
  final String name;
  final String rollNo;
  final double cgpa;
  final String yos;

  ApplicantCard(
      {required this.cgpa,
      required this.rollNo,
      required this.name,
      required this.yos});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          SizedBox(
            width: 5,
          ),
          Text(rollNo),
          SizedBox(
            width: 5,
          ),
          Text(
            cgpa.toString(),
          ),
        ],
      ),
    );
  }
}
