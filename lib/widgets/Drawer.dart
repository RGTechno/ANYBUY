import 'package:anybuy/provider/AuthData.dart';
import 'package:anybuy/screens/auth/AuthHome_Screen.dart';
import 'package:anybuy/screens/auth/AuthMerch_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthData>(context);
    final user = authData.auth.currentUser;
    final currentUserData = authData.currentUserData;
    if (user != null) {
      // print(user.uid + user.email);
      authData.getCurrentUserData("users", "${user.uid}");
      // print(currentUserData["firstname"]);
    } else {
      print("No user Signed in!!");
    }
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
                  user == null
                      ? "Welcome User"
                      : "Welcome ${currentUserData["firstname"]}",
                  style: GoogleFonts.architectsDaughter(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    user == null
                        ? Navigator.of(context).pushNamed(AuthHome.id)
                        : authData.signOut(context);
                  },
                  child: Text(
                    user == null ? "Login/Signup" : "Logout",
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
