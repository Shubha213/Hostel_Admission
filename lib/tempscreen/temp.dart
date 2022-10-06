import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sk_m/screens/admin_screen.dart';
import 'package:sk_m/screens/user_Screen.dart';

class temp extends StatelessWidget {
  const temp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // @override;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF90294A),
            title: const Text(
              'Home Page',
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                  child: Column(children: <Widget>[
                const SizedBox(
                  height: 200,
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: FlatButton(
                    color: const Color(0xFF90294A),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Userscreen()));
                    },
                    child: const Text(
                      'User',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: FlatButton(
                    color: const Color(0xFF90294A),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => AdminScreen()));
                    },
                    child: const Text(
                      'Admin',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ])),
            ),
          )),
    );
  }
}
