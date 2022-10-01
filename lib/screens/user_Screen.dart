import 'package:flutter/material.dart';
import 'package:hostel_app/screens/user_form.dart';
import 'package:hostel_app/screens/user_room.dart';

// import 'Rooms_Screen.dart';
// import 'Wing_Allot.dart';
// import 'details_screen.dart';

class Userscreen extends StatelessWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF90294A),
        title: const Text(
          "Dashboard",
          style: TextStyle(fontSize: 24, fontFamily: 'YOUR_FONT_FAMILY'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 219, 208, 208),
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_add_outlined, //change
              size: 40,
            ),
            label: 'Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded, //change
              size: 40,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 188, 8, 8),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Container(
              height: 275,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/gcek.jpg"),
                    fit: BoxFit.cover),
              ),
              // child: // Foreground widget here
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: const Text(
              "ADMISSION DETAILS",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: const SizedBox(
              height: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 30,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>user_form_screen(),),);
                              },
                              child: Container(
                                height: 80,
                                width: 130,
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.feed_outlined,
                                      size: 40,
                                      color: Color.fromARGB(255, 188, 8, 8),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "FORM",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              endIndent: 17,
                              width: 30,
                              color: Color.fromARGB(92, 0, 0, 0),
                              thickness: 2,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => user_room_screen(),),);
                              },
                              child: Container(
                                height: 80,
                                width: 130,
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.room_preferences_sharp,
                                      size: 40,
                                      color: Color.fromARGB(255, 188, 8, 8),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "ROOM",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       bottom: 23, left: 30, right: 30),
                      //   child: Divider(
                      //     color: Color.fromARGB(92, 0, 0, 0),
                      //     thickness: 2,
                      //   ),
                      // ),
                      // IntrinsicHeight(
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(bottom: 20),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {
                      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => WingAllot(),),);
                      //         },
                      //           child: Container(
                      //             height: 80,
                      //             width: 130,
                      //             child: Column(
                      //               children: const [
                      //                 Icon(
                      //                   Icons.add_home_work_outlined,
                      //                   size: 40,
                      //                   color: Color.fromARGB(255, 188, 8, 8),
                      //                 ),
                      //                 SizedBox(height: 5),
                      //                 Text(
                      //                   "WING ALLOT",
                      //                   style: TextStyle(
                      //                     fontSize: 16,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //           const VerticalDivider(
                      //             endIndent: 17,
                      //             width: 30,
                      //             color: Color.fromARGB(92, 0, 0, 0),
                      //             thickness: 2,
                      //           ),
                      //         GestureDetector(
                      //             onTap: () {
                      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoomScreen(),),);
                      //         },
                      //           child: Container(
                      //             height: 80,
                      //             width: 130,
                      //             child: Column(
                      //               children: const [
                      //                 Icon(
                      //                   Icons.library_books_outlined,
                      //                   size: 40,
                      //                   color: Color.fromARGB(255, 188, 8, 8),
                      //                 ),
                      //                 SizedBox(height: 5),
                      //                 Text(
                      //                   "MERIT LIST",
                      //                   style: TextStyle(
                      //                     fontSize: 16,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}