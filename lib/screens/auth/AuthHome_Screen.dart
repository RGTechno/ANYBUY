import 'package:anybuy/provider/AuthData.dart';
import 'package:anybuy/screens/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anybuy/widgets/InputFieldDec.dart';
import 'package:provider/provider.dart';

class AuthHome extends StatefulWidget {
  static String id = 'auth_home';

  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  final _authHomeKey = GlobalKey<FormState>();
  String userEmail = "";
  String userPass = "";
  String firstName = "";
  String lastName = "";
  bool wantSignup = false;

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthData>(context);
    void validate() async {
      if (!_authHomeKey.currentState.validate()) {
        print("Invalid");
        return;
      }
      _authHomeKey.currentState.save();
      if (!wantSignup) {
        await authData.login(userEmail, userPass, "users");
        await Navigator.of(context).pushReplacementNamed(HomeScreen.id);
      } else {
        authData.createUser(
          email: userEmail,
          pass: userPass,
          firstname: firstName,
          lastname: lastName,
        );
      }
    }

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
                                  firstName = newValue;
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
                                  lastName = newValue;
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
                            userPass = newValue;
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
