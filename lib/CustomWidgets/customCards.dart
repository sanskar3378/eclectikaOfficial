import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FancyCard extends StatelessWidget {
  FancyCard(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});

  final Image image;
  final String title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: SizedBox(
        height: height / 1.6,
        child: Center(
          child: Card(
            color: const Color.fromARGB(255, 208, 204, 208),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: width / 1.15,
                      height: height / 2.45,
                      child: image,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      title,
                      style: GoogleFonts.lobster(
                        fontSize: 50.0,
                        color: const Color.fromARGB(255, 108, 14, 35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  OutlinedButton(
                    onPressed: onPressed,
                    child: const Text(
                      "Learn more",
                      style: TextStyle(
                        // color: Color.fromARGB(255, 108, 14, 35),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
