import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

import '../Constants/strings.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset("${S.carousel}5.png"),

            Text(
              'ECLECTIKA\'23',
              style: GoogleFonts.titanOne(fontSize: 40, color: Colors.yellow),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.yellow),
              height: 120,
              // child: LoadingIndicator(
              //     indicatorType: Indicator.pacman, /// Required, The loading type of the widget
              //     colors: [Colors.brown, Colors.yellow, Colors.amber, ],       /// Optional, The color collections
              //     strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
              //     backgroundColor: Colors.transparent,      /// Optional, Background of the widget
              //     pathBackgroundColor: Colors.transparent   /// Optional, the stroke backgroundColor
              // ),
              child: Lottie.asset(
                'asset/loading/loading.json',
              ),
            )
          ],
        ),
      ),
    );
  }
}
