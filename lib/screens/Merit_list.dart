import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sk_m/screens/admin_screen.dart';

class MeritList extends StatefulWidget {
  const MeritList({Key? key}) : super(key: key);

  @override
  State<MeritList> createState() => _MeritListState();
}

class _MeritListState extends State<MeritList> {
  String dropdownvalue1 = 'YEAR';
  String dropdownvalue2 = 'BRANCH';
  String dropdownvalue3 = 'GENDER';

  var year = [
    'YEAR',
    'FY',
    'SY',
    'TY',
    'B.Tech',
  ];

  var branch = [
    'BRANCH',
    'Civil',
    'Mechanical',
    'Electrical',
    'IT',
    'ENTC',
  ];

  var gn = [
    'GENDER',
    'MALE',
    'FEMALE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF90294A),
            title: Text('Merit List')),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 40),
          child: Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Column(
                    children: const [
                      Text(
                        'SELECT YEAR  -  ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      DropdownButton(
                        value: dropdownvalue1,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: year.map((String items) {
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
                  )
                ]),
                Row(children: [
                  Column(
                    children: const [
                      Text(
                        'SELECT BRANCH  -  ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      DropdownButton(
                        value: dropdownvalue2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: branch.map((String items) {
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
                  )
                ]),
                Row(children: [
                  Column(
                    children: const [
                      Text(
                        'SELECT GENDER  -  ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      DropdownButton(
                        value: dropdownvalue3,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: gn.map((String items) {
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
                  )
                ]),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            margin: EdgeInsets.all(25),
                            child: FlatButton(
                              child: Text(
                                'Apply Changes',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              color: Color(0xFF90294A),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AdminScreen()));
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
        ));
  }
}
