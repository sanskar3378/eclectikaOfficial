import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customBanner(
    {required String imagePath,
    required String bgPath,
    required String text,
    required double height,
    required double width}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.yellow, width: 2),
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
          image: AssetImage(bgPath), fit: BoxFit.cover, opacity: 0.8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(2),
          child: Text(
            text,
            style: GoogleFonts.sen(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
