import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  var _phoneNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF90294A),
          title: const Text(
            "Application Form",
            style: TextStyle(fontSize: 24, fontFamily: 'YOUR_FONT_FAMILY'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Form(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 46,
                        child: TextFormField(
                          controller: _phoneNo,
                          decoration: InputDecoration(
                            labelText: 'Phone Number: ',
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(173, 22, 22, 22),
                                  width: 2),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            fillColor: Color.fromARGB(143, 253, 251, 251),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(173, 22, 22, 22),
                                  width: 2),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
