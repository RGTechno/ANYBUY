import 'package:anybuy/widgets/InputFieldDec.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthMerchant extends StatefulWidget {
  static String id = 'auth_merchant';

  @override
  _AuthMerchantState createState() => _AuthMerchantState();
}

class _AuthMerchantState extends State<AuthMerchant> {
  final _authMerchantKey = GlobalKey<FormState>();
  String merchEmail = "";
  String merchPass = "";
  String merchFirstName = "";
  String merchLastName = "";
  bool wantSignup = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createMerchant() async {
    print("create user running");
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: merchEmail,
        password: merchPass,
      );

      await firestore
          .collection("merchant")
          .doc("${userCredential.user.uid}")
          .set({
        "id": "${userCredential.user.uid}",
        "firstname": "$merchFirstName",
        "lastname": "$merchLastName",
        "email": "$merchEmail",
        "isMerchant": true,
      });

      print(
        "User Created ${userCredential.user.email}, ${userCredential.user.uid}",
      );

      setState(() {
        merchEmail = "";
        merchPass = "";
        merchFirstName = "";
        merchLastName = "";
        wantSignup = !wantSignup;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login() async {
    print("login running");

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: merchEmail,
        password: merchPass,
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
    if (!_authMerchantKey.currentState.validate()) {
      print("Invalid");
      return;
    }
    _authMerchantKey.currentState.save();
    !wantSignup ? login() : createMerchant();
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
                "HI! Merchant",
                style: GoogleFonts.architectsDaughter(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _authMerchantKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wantSignup
                        ? Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextFormField(
                              decoration: inpDec(
                                "First Name",
                                "First Name",
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  merchFirstName = newValue;
                                });
                              },
                            ),
                          )
                        : Container(),
                    wantSignup
                        ? Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextFormField(
                              decoration: inpDec(
                                "Last Name",
                                "Last Name",
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  merchLastName = newValue;
                                });
                              },
                            ),
                          )
                        : Container(),
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
                            merchEmail = newValue;
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
                        obscureText: true,
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
                            merchPass = newValue;
                          });
                        },
                      ),
                    ),
                    TextButton.icon(
                      onPressed: validate,
                      icon: Icon(
                        !wantSignup
                            ? Icons.login_rounded
                            : Icons.app_registration,
                        color: Colors.black54,
                      ),
                      label: Text(
                        !wantSignup ? "Login" : "Create",
                        style: GoogleFonts.poppins(
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
                      onPressed: () {
                        setState(() {
                          wantSignup = !wantSignup;
                        });
                      },
                      child: !wantSignup
                          ? Text(
                              "New User! Sign Up Here",
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                              ),
                            )
                          : Text(
                              "Already a member!,Login Here",
                              style: GoogleFonts.poppins(
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
