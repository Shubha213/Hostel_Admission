import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF90294A),
        title: const Text(
          "Admin",
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
              Icons.business,
              size: 40,
            ),
            label: 'Notices',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              size: 40,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.amber[800],
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
                    image: AssetImage("assets/img/download.jpg"),
                    fit: BoxFit.cover),
              ),
              // child: // Foreground widget here
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "MANAGE HOSTEL",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 30,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 130,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.account_box_rounded,
                                  size: 60,
                                ),
                                Text(
                                  "Details",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Container(
                            height: 100,
                            width: 130,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.account_box_rounded,
                                  size: 60,
                                ),
                                Text(
                                  "Rooms",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 30, right: 30),
                        child: Divider(
                          color: Color.fromARGB(221, 55, 54, 54),
                          thickness: 3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 130,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.account_box_rounded,
                                  size: 60,
                                ),
                                Text(
                                  "Wing Allot",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                            height: 100,
                            width: 130,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.list_outlined,
                                  size: 60,
                                ),
                                Text(
                                  "Merit List",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
