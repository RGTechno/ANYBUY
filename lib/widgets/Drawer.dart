import 'package:anybuy/screens/auth/AuthHome_Screen.dart';
import 'package:anybuy/screens/auth/AuthMerch_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          DrawerHeader(
            duration: Duration(
              milliseconds: 300,
            ),
            decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome User",
                  style: GoogleFonts.architectsDaughter(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AuthHome.id);
                  },
                  child: Text(
                    "Login/Signup",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 20),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt_1_rounded),
            title: Text(
              "ANYBUY Buisness",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AuthMerchant.id);
            },
          ),
        ],
      ),
    );
  }
}
