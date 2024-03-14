import 'package:flutter/material.dart';

// class ScreenBackground1 extends StatelessWidget {
//   const ScreenBackground1({super.key, this.elementId = ''});
//   final String elementId;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,

//         ),
//       ),
//       child: null,
//     );
//   }
// }

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
