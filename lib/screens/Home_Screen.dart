import 'package:anybuy/widgets/Categories.dart';
import 'package:anybuy/widgets/Drawer.dart';
import 'package:anybuy/widgets/Search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          title: Text(
            "ANYBUY",
            style: GoogleFonts.architectsDaughter(
              color: Colors.black87,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(),
              Categories(),
            ],
          ),
        ),
      ),
    );
  }
}
