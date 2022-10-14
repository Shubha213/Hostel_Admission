import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sk_m/screens/user_Screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sk_m/reusable_widgets/reusable_widget.dart';

import '../reusable_widgets/reusable_widget.dart';

class user_room_screen extends StatefulWidget {
  const user_room_screen({Key? key}) : super(key: key);

  @override
  State<user_room_screen> createState() => user_room_screenState();
}

class user_room_screenState extends State<user_room_screen> {
  final user = FirebaseAuth.instance.currentUser;
  String dropdownvalue1 = 'HOSTEL';
  String dropdownvalue2 = 'WING';
  String dropdownvalue3 = 'ROOM NO';
  TextEditingController _tableno = TextEditingController();
  TextEditingController _bedno = TextEditingController();
  TextEditingController _chairno = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var hostel = [
    'HOSTEL',
    'Hostel B',
    'Hostel C',
    'Hostel D',
    'Jijau',
  ];

  var wing = [
    'WING',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
  ];

  var room = [
    'ROOM NO',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF90294A),
          title: const Text('Room Details'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Column(
                      children: const [
                        Text(
                          'HOSTEL NAME  -  ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          DropdownButton(
                            value: dropdownvalue1,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: hostel.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue1 = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ]),
                  Row(children: [
                    Column(
                      children: const [
                        Text(
                          'WING NAME  -  ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          DropdownButton(
                            value: dropdownvalue2,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: wing.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue2 = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ]),
                  Row(children: [
                    Column(
                      children: const [
                        Text(
                          'ROOM NO.  -  ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: Column(
                        children: [
                          DropdownButton(
                            value: dropdownvalue3,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: room.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue3 = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ]),
                  Container(
                      margin: const EdgeInsets.only(top: 20, right: 10),
                      child: buildtableno('BED NO.', _bedno)),
                  Container(
                      margin: const EdgeInsets.only(top: 20, right: 10),
                      child: buildtableno('CHAIR NO.', _chairno)),
                  Container(
                      margin: const EdgeInsets.only(top: 20, right: 10),
                      child: buildtableno('TABLE NO.', _tableno)),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: Container(
                              margin: EdgeInsets.all(25),
                              child: FlatButton(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Done',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                color: Color(0xFF90294A),
                                textColor: Colors.white,
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }

                                  FirebaseFirestore.instance
                                      .collection("Room_Data")
                                      .add({
                                    "Hostel_Name": dropdownvalue1.toString(),
                                    "Wing_Name": dropdownvalue2.toString(),
                                    "Room_No": dropdownvalue3.toString(),
                                    "BED_No": _bedno.text,
                                    "Chair_No": _chairno.text,
                                    "Table_No": _tableno.text,
                                    "UID": _auth.currentUser!.uid
                                  }).then((value) {
                                    print("Room Details Added");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Userscreen()));
                                  }).onError(((error, stackTrace) {
                                    print("Error${error.toString()}");
                                  }));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
