import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  final List<Map<String, dynamic>> catMap = [
    {"color": Colors.tealAccent, "text": "Restaurants"},
    {"color": Colors.pinkAccent, "text": "Stationaries"},
    {"color": Colors.purpleAccent, "text": "Grocery"},
    {"color": Colors.redAccent, "text": "Medicines"},
    {"color": Colors.orangeAccent, "text": "Hypermarts"},
    {"color": Colors.yellow, "text": "Dairy"},
    {"color": Colors.lightGreenAccent, "text": "Sports"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 50,
        maxHeight: 100,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 8.0,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: catMap[index]["color"],
                ),
                Text(
                  catMap[index]["text"],
                  style: GoogleFonts.architectsDaughter(
                    fontSize: 13
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 7,
      ),
    );
  }
}
