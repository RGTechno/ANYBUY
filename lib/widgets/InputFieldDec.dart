import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration inpDec(String hintText, String labelText) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    labelStyle: GoogleFonts.architectsDaughter(),
    prefixIcon: Icon(
      Icons.search,
      color: Colors.black38,
    ),
    hintStyle: GoogleFonts.architectsDaughter(fontSize: 13),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.tealAccent),
    ),
  );
}
