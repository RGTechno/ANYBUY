import 'package:anybuy/widgets/InputFieldDec.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthMerchant extends StatefulWidget {
  static String id = 'auth_merchant';

  @override
  _AuthMerchantState createState() => _AuthMerchantState();
}

class _AuthMerchantState extends State<AuthMerchant> {
  final _authMerchantKey = GlobalKey<FormState>();

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
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        decoration: inpDec(
                          "Enter Email-ID",
                          "Email",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        decoration: inpDec(
                          "Enter Password",
                          "Password",
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
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
                      onPressed: () {},
                      child: Text(
                        "New Merchant! Sign Up Here",
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
