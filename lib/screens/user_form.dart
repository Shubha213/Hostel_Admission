import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sk_m/reusable_widgets/reusable_widget.dart';
import 'package:sk_m/screens/user_Screen.dart';

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
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  final format = DateFormat('dd/MM/yyyy');
  TextEditingController _name = TextEditingController();
  TextEditingController tt = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  // TextEditingController _course = TextEditingController();
  // TextEditingController _yos = TextEditingController();
  TextEditingController _roll = TextEditingController();
  // late String _name = " ";
  // late String _email = " ";
  // late String _phoneNumber = " ";
  late String _course = "";
  late String _yos = "";
  // late String _roll = " ";

  // late String _date;

  var _date;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List complaintTypeList = [
    {"title": "IT", "value": "IT"},
    {"title": "CIVIL", "value": "Civil"},
    {"title": "ELECT", "value": "Elect"},
    {"title": "MECH", "value": "Mech"},
    {"title": "ENTC", "value": "Entc"},
  ];

  List YearofStudy = [
    {"title": "FY", "value": "1"},
    {"title": "SY", "value": "2"},
    {"title": "TY", "value": "3"},
    {"title": "FE", "value": "4"},
    // {"title": "ENTC", "value": "Entc"},
  ];

  String defaultValue = "";

  // static DateTime now;

  Widget _buildName() {
    return TextFormField(
      controller: _name,
      decoration: InputDecoration(
        labelText: 'Name : ',
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: const Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Color.fromARGB(143, 253, 251, 251),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      // onSaved: (aa) {
      //   _name = aa.toString();
      // },
    );
  }

  Widget _Date() {
    return Container(
      width: 200,
      child: DateTimeField(
        format: format,
        decoration: InputDecoration(
          labelText: "Select Date:",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: const Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: Color.fromARGB(143, 253, 251, 251),
          filled: true,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(173, 22, 22, 22), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIcon: Icon(
            Icons.calendar_today_rounded,
            color: Color.fromARGB(255, 134, 123, 123),
          ),
        ),
        onShowPicker: (context, currentValue) async {
          _date = await showDatePicker(
              context: context,
              initialDate: currentValue ?? DateTime.now(),
              firstDate: DateTime(1990),
              lastDate: DateTime(2100));
          return _date;
        },
      ),
    );
  }

  Widget _builRoll() {
    return TextFormField(
      controller: _roll,
      decoration: InputDecoration(
        labelText: 'Roll No : ',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: const Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Color.fromARGB(143, 253, 251, 251),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Roll No. is required';
        }

        return null;
      },
      // onSaved: (value) {
      //   _roll = value!;
      // },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _email,
      decoration: InputDecoration(
        labelText: 'Email : ',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: const Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Color.fromARGB(143, 253, 251, 251),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
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
      // onSaved: (value) {
      //   _email = value!;
      // },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: _phoneNumber,
      decoration: InputDecoration(
        labelText: 'Phone Number : ',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: const Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Color.fromARGB(143, 253, 251, 251),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(173, 22, 22, 22), width: 2),
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
      // onSaved: (value) {
      //   _phoneNumber = value!;
      // },
    );
  }

  Widget _courseSelect() {
    return Container(
      width: 150,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: const Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
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
            validator:
            (value) => value == null ? 'field required' : null;
          }),
    );
  }

  Widget _yoStudy() {
    return Container(
      width: 158,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: const Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: Color.fromARGB(143, 253, 251, 251),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(173, 22, 22, 22), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          value: defaultValue,
          //isExpanded: true,

          items: [
            const DropdownMenuItem(child: Text("Year of Study"), value: ""),
            ...YearofStudy.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                  child: Text(e['title']), value: e['value']);
            }).toList(),
          ],
          onChanged: (value) {
            setState(() => _yos = value.toString());
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
                _builRoll(),
                SizedBox(height: 20),
                _buildEmail(),
                SizedBox(height: 20),
                _buildPhoneNumber(),
                SizedBox(height: 20),
                Row(
                  children: [
                    _courseSelect(),
                    SizedBox(width: 30),
                    _yoStudy(),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 1),
                  child: Row(
                    children: [
                      const Text(
                        'DOB',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          margin: const EdgeInsets.all(10), child: _Date()),
                    ],
                  ),
                ),
                reusableInput('text', tt),
                // SizedBox(
                //   height: 20,
                // ),
                const SizedBox(height: 100),

                RaisedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    FirebaseFirestore.instance
                        .collection("hosteller info")
                        .add({
                      "Name": _name.text,
                      "Roll_no": _roll.text,
                      "Email": _email.text,
                      "Phone": _phoneNumber.text,
                      "Course": _course.toString(),
                      "YearofStudy": _yos.toString(),
                      "DOB": _date.toString(),
                    }).then((value) {
                      print("Created New Account");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Userscreen()));
                    }).onError(((error, stackTrace) {
                      print("Error${error.toString()}");
                    }));

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
