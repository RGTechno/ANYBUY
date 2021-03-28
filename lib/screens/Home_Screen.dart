import 'package:anybuy/widgets/Search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ANYBUY",
            style: GoogleFonts.architectsDaughter(
                color: Colors.black, fontSize: 35, fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: SearchBar(),
        ),
      ),
    );
  }
}
