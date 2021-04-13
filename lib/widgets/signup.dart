import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'InputFieldDec.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextFormField(
            decoration: inpDec(
              "Enter Email-ID",
              "Email",
            ),
            validator: (String value) {
              if (value.isEmpty || !value.contains("@")) {
                return "Invalid";
              }
              return null;
            },
            onSaved: (newValue) {
              setState(() {
                userEmail = newValue;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextFormField(
            decoration: inpDec(
              "Enter Password",
              "Password",
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return "Required";
              }
              if (value.length < 5) {
                return "Password should be more than 5 characters";
              }
              return null;
            },
            onSaved: (newValue) {
              setState(() {
                userPass = newValue;
              });
            },
          ),
        ),
        TextButton.icon(
          onPressed: validate,
          icon: Icon(
            Icons.login_rounded,
            color: Colors.black54,
          ),
          label: Text(
            "Login",
            style: GoogleFonts.architectsDaughter(
              color: Colors.black54,
            ),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 20),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: createUser,
          child: Text(
            "New User! Sign Up Here",
            style: GoogleFonts.architectsDaughter(
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
