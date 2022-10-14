import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sk_m/screens/Rooms_Screen.dart';

class ApplicantNote {
  final String course;
  final String DOB;
  final String email;
  final String name;
  final String phoneNumber;
  final String rollNo;
  final String yearOfStudy;
  final double cgpa;
  // final String gender;

  ApplicantNote({
    required this.course,
    required this.DOB,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.rollNo,
    required this.yearOfStudy,
    required this.cgpa,
    // required this.gender,
  });

  ApplicantNote.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : course = snapshot.data()["Course"] as String,
        DOB = snapshot.data()["DOB"] as String,
        email = snapshot.data()["Email"] as String,
        name = snapshot.data()["Name"] as String,
        phoneNumber = snapshot.data()["Phone"] as String,
        rollNo = snapshot.data()["Roll_no"] as String,
        cgpa = snapshot.data()["last year CGPA"] as double,
        // gender = snapshot.data()["Gender"] as String,
        yearOfStudy = snapshot.data()["YearofStudy"] as String;
}
