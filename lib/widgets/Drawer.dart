import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text("User Login"),
            onTap: () {
              Navigator.of(context).pushNamed("/authHome");
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt_1_rounded),
            title: Text("I Am A Merchant"),
            onTap: () {
              Navigator.of(context).pushNamed("/authHome");
            },
          ),
        ],
      ),
    );
  }
}
