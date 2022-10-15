import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'admin_screen.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
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
          title: const Text('Room Allot'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 40),
          child: Container(
            height: 150,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(218, 16, 16, 17),
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              value: dropdownvalue1,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: year.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue1 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(218, 16, 16, 17),
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              value: dropdownvalue2,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: branch.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue2 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(218, 16, 16, 17),
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              value: dropdownvalue3,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: gn.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue3 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
          ),
        ));
  }
}
