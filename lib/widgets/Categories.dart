import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  final List<Map<String, String>> catMap = [
    {
      "image":
          "https://www.pngkit.com/png/detail/366-3665671_restaurant-meal-food-clipart-transparent-background.png",
      "text": "Restaurants"
    },
    {
      "image":
          "https://library.kissclipart.com/20190916/wgq/kissclipart-clip-art-toy-stationery-f3217c38ff505a8b.png",
      "text": "Stationaries"
    },
    {
      "image":
          "https://www.clipartkey.com/mpngs/m/60-609806_transparent-grocery-store-clip-art.png",
      "text": "Grocery"
    },
    {
      "image":
          "https://lh3.googleusercontent.com/proxy/_tjMe5xF7ii5Jsw1Cu8cwOaAJkqQ2SU-Mt9diDzF25ZnmqpOOok3iTo_kr7yxhPmAPNA_I9lbzP4Q0kj1nkkcLJa4kmi1tCp1Q",
      "text": "Medicines"
    },
    {
      "image":
          "https://thumbs.dreamstime.com/b/supermarket-facade-people-shopping-product-hypermarket-grocery-food-store-male-female-buyers-vector-background-153201502.jpg",
      "text": "Hypermarts"
    },
    {
      "image":
          "https://lh3.googleusercontent.com/proxy/XDXSMTZk3xQXrvg-VfEFawSBcJjthQts0W61KlI-x6k3pHO_jHjKQOjh04aXn1QpIyhBDpwX7URF05EgDiiWO_3JZoJiUCc_gA",
      "text": "Dairy"
    },
    {
      "image":
          "https://i.pinimg.com/originals/e0/38/7b/e0387b9c6cc7a269ba92f92f8b8321ac.png",
      "text": "Sports"
    },
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
                  backgroundImage: NetworkImage(
                    catMap[index]["image"],
                  ),
                  // backgroundColor: catMap[index]["color"],
                ),
                Text(
                  catMap[index]["text"],
                  style: GoogleFonts.architectsDaughter(fontSize: 13),
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
