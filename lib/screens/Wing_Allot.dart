import 'package:sk_m/screens/admin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable_widgets/reusable_widget.dart';

class WingAllot extends StatefulWidget {
  const WingAllot({Key? key}) : super(key: key);

  @override
  State<WingAllot> createState() => _WingAllotState();
}

class _WingAllotState extends State<WingAllot> {
  late String _hostel = "";
  late String _wing = "";
  late String _year = "";
  late String _branch = "";
  late String _gender = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List hostel = [
    {"title": "HOSTEL B", "value": "HOSTEL_B"},
    {"title": "HOSTEL C", "value": "HOSTEL_C"},
    {"title": "HOSTEL D", "value": "HOSTEL_D"},
    {"title": "JIJAU", "value": "JIJAU"},
  ];

  List wing = [
    {"title": "A", "value": "A"},
    {"title": "B", "value": "B"},
    {"title": "C", "value": "C"},
    {"title": "D", "value": "D"},
    {"title": "E", "value": "E"},
    {"title": "F", "value": "F"},
    {"title": "G", "value": "G"},
    {"title": "H", "value": "H"},
    {"title": "I", "value": "I"},
    {"title": "J", "value": "J"},
  ];
  List year = [
    {"title": "FY", "value": "FY"},
    {"title": "SY", "value": "SY"},
    {"title": "TY", "value": "TY"},
    {"title": "B.Tech", "value": "B.Tech"},
  ];

  List branch = [
    {"title": "Civil", "value": "Civil"},
    {"title": "Mechanical", "value": "Mechanical"},
    {"title": "Electrical", "value": "Electrical"},
    {"title": "IT", "value": "IT"},
    {"title": "ENTC", "value": "ENTC"},
  ];
  List gender = [
    {"title": "MALE", "value": "MALE"},
    {"title": "FEMALE", "value": "FEMALE"},
  ];

  @override
  Widget _selecthostel() {
    var defaultValue = "";
    return Container(
      width: 150,
      height: 60,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: const Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: Color.fromARGB(143, 253, 251, 251),
          filled: true,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        value: defaultValue,
        onChanged: (value) {
          setState(() => _hostel = value.toString());
        },
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        items: [
          const DropdownMenuItem(child: Text("Hostel"), value: ""),
          ...hostel.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem(child: Text(e['title']), value: e['value']);
          }).toList(),
        ],
      ),
    );
  }

  Widget _selectwing() {
    var defaultValue = "";
    return Container(
      width: 150,
      height: 60,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: const Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          value: defaultValue,
          items: [
            const DropdownMenuItem(child: Text("Wing"), value: ""),
            ...wing.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                  child: Text(e['title']), value: e['value']);
            }).toList(),
          ],
          onChanged: (value) {
            setState(() => _wing = value.toString());
            validator:
            (value) => value == null ? 'field required' : null;
          }),
    );
  }

  Widget _selectyear() {
    var defaultValue = "";
    return Container(
      width: 150,
      height: 60,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: const Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          value: defaultValue,
          items: [
            const DropdownMenuItem(child: Text("Year"), value: ""),
            ...year.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                  child: Text(e['title']), value: e['value']);
            }).toList(),
          ],
          onChanged: (value) {
            setState(() => _year = value.toString());
            validator:
            (value) => value == null ? 'field required' : null;
          }),
    );
  }

  Widget _selectbranch() {
    var defaultValue = "";
    return Container(
      width: 150,
      height: 60,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: const Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          value: defaultValue,
          items: [
            const DropdownMenuItem(child: Text("Branch"), value: ""),
            ...branch.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                  child: Text(e['title']), value: e['value']);
            }).toList(),
          ],
          onChanged: (value) {
            setState(() => _branch = value.toString());
            validator:
            (value) => value == null ? 'field required' : null;
          }),
    );
  }

  Widget _selectgender() {
    var defaultValue = "";
    return Container(
      width: 150,
      height: 60,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: const Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          value: defaultValue,
          items: [
            const DropdownMenuItem(child: Text("Gender"), value: ""),
            ...gender.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                  child: Text(e['title']), value: e['value']);
            }).toList(),
          ],
          onChanged: (value) {
            setState(() => _gender = value.toString());
            validator:
            (value) => value == null ? 'field required' : null;
          }),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF90294A),
          title: const Text('Wing Allot'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Column(
                        children: const [
                          Text(
                            'HOSTEL NAME  -  ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Column(
                          children: [
                            _selecthostel(),
                          ],
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Column(
                        children: const [
                          Text(
                            'WING NAME  -  ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Column(
                          children: [_selectwing()],
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Column(
                        children: const [
                          Text(
                            'SELECT YEAR  -  ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Column(
                          children: [_selectyear()],
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Column(
                        children: const [
                          Text(
                            'SELECT BRANCH  -  ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Column(
                          children: [_selectbranch()],
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Column(
                        children: const [
                          Text(
                            'SELECT GENDER  -  ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Column(
                          children: [_selectgender()],
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF90294A)),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          // _formKey.currentState!.save();
                          return;
                        }

                        FirebaseFirestore.instance
                            .collection("Wing_Allot")
                            .add({
                          "hostel": _hostel.toString(),
                        }).then((value) {
                          print("Room Alloted");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminScreen()));
                        }).onError(((error, stackTrace) {
                          print("Error${error.toString()}");
                        }));

                        //Send to API
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
