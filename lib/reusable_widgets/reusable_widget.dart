import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/framework.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    // color: Colors.white,
  );
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

TextFormField reusableInput(
  String text,
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: const Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      fillColor: Color.fromARGB(143, 253, 251, 251),
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    validator: (String? value) {
      if (value!.isEmpty) {
        return text;
      }

      return null;
    },
  );
}

TextFormField buildtableno(
  String text,
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.fromLTRB(20, 30, 10, 0),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: const Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: Color.fromARGB(143, 253, 251, 251),
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromARGB(173, 22, 22, 22), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return text;
      }

      return null;
    },
  );
}

Container _studcategory(
    List Category, String _takecategory, String defaultValue) {
  _takecategory = "";
  defaultValue = "";
  return Container(
    width: 400,
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
        const DropdownMenuItem(child: Text("Category"), value: ""),
        ...Category.map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem(child: Text(e['title']), value: e['value']);
        }).toList(),
      ],
      // onChanged: (value) {
      //   setState(() => _takecategory = value.toString());
      // },
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      onChanged: (String? value) {},
    ),
  );
}
