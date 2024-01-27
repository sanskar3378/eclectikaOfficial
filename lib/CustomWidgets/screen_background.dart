import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ScreenBackground1 extends StatelessWidget {
  const ScreenBackground1({super.key, this.elementId = ''});
  final String elementId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            C.vintageBackdrop4,
            C.vintageBackdrop4,
            C.vintageBackdrop3,
            C.vintageBackdrop2,
            C.vintageBackdrop2,
            C.vintageBackdrop3,
            C.vintageBackdrop4,
            C.vintageBackdrop4,
          ],
        ),
      ),
      child: null,
    );
  }
}

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, this.elementId = ''});
  final String elementId;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xff0E0207),
      child: Image.asset('asset/welcomeCarousel/background.png',
          fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
    );
  }
}
