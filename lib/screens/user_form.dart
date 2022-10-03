import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// class UserForm extends StatefulWidget {
//   const UserForm({Key? key}) : super(key: key);

//   @override
//   State<UserForm> createState() => _
// class FormScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//   return _UserFormState();
// }

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late String _name;
  late String _email;
  late String _phoneNumber;
  late String _course;
  late String _YOS;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List complaintTypeList = [
    {"title": "IT", "value": "IT"},
    {"title": "CIVIL", "value": "Civil"},
    {"title": "ELECT", "value": "Elect"},
    {"title": "MECH", "value": "Mech"},
    {"title": "ENTC", "value": "Entc"},
  ];

  List YearofStudy = [
    {"title": "I", "value": "1"},
    {"title": "II", "value": "2"},
    {"title": "III", "value": "3"},
    {"title": "IV", "value": "4"},
    // {"title": "ENTC", "value": "Entc"},
  ];

  String defaultValue = "";

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name : ',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Color.fromARGB(143, 253, 251, 251),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email : ',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Color.fromARGB(143, 253, 251, 251),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone Number : ',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Color.fromARGB(143, 253, 251, 251),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _courseSelect() {
    return Container(
      width: 130,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          value: defaultValue,
          //isExpanded: true,

          items: [
            const DropdownMenuItem(child: Text("Course"), value: ""),
            ...complaintTypeList.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                  child: Text(e['title']), value: e['value']);
            }).toList(),
          ],
          onChanged: (value) {
            setState(() => _course = value.toString());
          }),
    );
  }

  Widget _yoStudy() {
    return Container(
      width: 130,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          value: defaultValue,
          //isExpanded: true,

          items: [
            const DropdownMenuItem(child: Text("Course"), value: ""),
            ...YearofStudy.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                  child: Text(e['title']), value: e['value']);
            }).toList(),
          ],
          onChanged: (value) {
            setState(() => _YOS = value.toString());
          }),
    );
  }

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                SizedBox(height: 20),
                _buildEmail(),
                SizedBox(height: 20),
                _buildPhoneNumber(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        _courseSelect(),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();

                    print(_name);
                    print(_email);
                    print(_phoneNumber);
                    print(_course);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//

















//