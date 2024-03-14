import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FancyCardb extends StatelessWidget {
  FancyCardb({
    super.key,
    required this.image,
    required this.text,
  });

  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 208, 204, 208),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              width: 290,
              height: 290,
              child: image,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(text,
                  style: GoogleFonts.sen(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
