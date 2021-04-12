import 'package:anybuy/widgets/InputFieldDec.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHome extends StatefulWidget {
  static String id = 'auth_home';

  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  final _authHomeKey = GlobalKey<FormState>();
  String userEmail = "";
  String userPass = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  void createUser() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPass,
      );
      print(userCredential.user.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void validate() {
    if (!_authHomeKey.currentState.validate()) {
      print("Invalid");
      return;
    }
    _authHomeKey.currentState.save();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   iconTheme: IconThemeData(
        //     color: Colors.black87,
        //   ),
        //   backgroundColor: Colors.transparent,
        // ),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "HI! User",
                style: GoogleFonts.architectsDaughter(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _authHomeKey,
                child: Column(
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
