import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  String dropdownvalue1 = 'YEAR';
  String dropdownvalue2 = 'BRANCH';
  String dropdownvalue3 = 'GENDER';

  // List of items in our dropdown menu
  var year = [
    'YEAR',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var branch = [
    'BRANCH',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var gn = [
    'GENDER',
    'MALE',
    'FEMALE',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF90294A),
            title: const Text("Details")),
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
                        'SELECT YEAR  :-  ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      // Text('DropDown',style: TextStyle(fontSize: 18),),
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
                        'SELECT BRANCH  :-  ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      // Text(
                      //   'DropDown',
                      //   style: TextStyle(fontSize: 18),
                      // ),
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
                        'SELECT YEAR  :-  ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      // Text(
                      //   'DropDown',
                      //   style: TextStyle(fontSize: 18),
                      // ),
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
              ],
            ),
          ),
        ));
  }
}
