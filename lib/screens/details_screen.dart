import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sk_m/screens/admin_screen.dart';
import 'package:sk_m/utils/applicant_card.dart';
import 'package:sk_m/utils/cloud_note.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  String dropdownvalue1 = 'FY';
  String dropdownvalue2 = 'IT';
  String dropdownvalue3 = 'MALE';

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

  Stream<Iterable<ApplicantNote>> allReviews() {
    return FirebaseFirestore.instance
        .collection("Hostel Applicants")
        .snapshots()
        .map(
          (event) => event.docs
              .map((doc) => ApplicantNote.fromSnapshot(doc))
              .where(
                  (element) =>
                      (element.course == dropdownvalue2) &&
                      (element.yearOfStudy == dropdownvalue1)
                  // &&
                  // (element.gender == dropdownvalue3),
                  ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF90294A),
        title: const Text('Applicant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 40),
        child: Column(
          children: [
            Container(
              // height: 250,
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
                            padding: const EdgeInsets.only(left: 25),
                            child: Container(
                                // margin: EdgeInsets.all(25),
                                // child: FlatButton(
                                //   child: Text(
                                //     'Apply Changes',
                                //     style: TextStyle(fontSize: 20.0),
                                //   ),
                                //   color: Color(0xFF90294A),
                                //   textColor: Colors.white,
                                //   onPressed: () {
                                //     Navigator.of(context).push(MaterialPageRoute(
                                //         builder: (_) => AdminScreen()));
                                //   },
                                // ),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
              child: Divider(
                height: 5,
                color: Colors.black,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: StreamBuilder(
                stream: allReviews(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      if (snapshot.hasData) {
                        final allReviews =
                            snapshot.data as Iterable<ApplicantNote>?;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: allReviews?.length,
                          itemBuilder: (context, index) {
                            final review = allReviews?.elementAt(index);
                            return ApplicantCard(
                              name: review!.name,
                              rollNo: review.rollNo,
                              cgpa: review.cgpa,
                              yos: review.yearOfStudy,
                            );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    default:
                      const CircularProgressIndicator();
                  }
                  return const Text("We do not returned anything");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
