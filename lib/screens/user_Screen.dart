import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sk_m/screens/sign_In.dart';
import 'package:sk_m/screens/user_form.dart';
import 'package:sk_m/screens/user_room.dart';

enum MenuAction { logout, item2, item3, item4 }

class Userscreen extends StatelessWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectedMenu = "";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFF90294A),
        title: const Text(
          "Dashboard",
          style: TextStyle(fontSize: 24, fontFamily: 'YOUR_FONT_FAMILY'),
        ),
        actions: [
          PopupMenuButton<MenuAction>(
            color: Color.fromARGB(255, 245, 174, 68),
            iconSize: 40,
            icon: const Icon(Icons.person),
            onSelected: (MenuAction item) async {
              if (item == MenuAction.logout) {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SignInScreen()));
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<MenuAction>(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  value: MenuAction.logout,
                  child: Text('Logout'),
                ),
              ];
            },
          )
        ],
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
      body: SingleChildScrollView(
        child: Column(
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
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => UserForm(),
                                    ),
                                  );
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
                              const VerticalDivider(
                                endIndent: 17,
                                width: 30,
                                color: Color.fromARGB(92, 0, 0, 0),
                                thickness: 2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => user_room_screen(),
                                    ),
                                  );
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
