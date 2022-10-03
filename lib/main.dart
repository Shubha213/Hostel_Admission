import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/screens/admin_screen.dart';
import 'package:hostel_app/screens/user_Screen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF90294A),
            title: Text(
              'Home Page',
            ),
          ),
          body: Center(
              child: Column(children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'User',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Color(0xFF90294A),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Userscreen()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'Admin',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Color(0xFF90294A),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AdminScreen()));
                },
              ),
            ),
          ]))),
    );
  }
}
