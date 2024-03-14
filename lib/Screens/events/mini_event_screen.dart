import 'package:eclectika23_official_app/CustomWidgets/eventCards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/eventsList.dart';

class MiniEventScreen extends StatelessWidget {
  MiniEventScreen({super.key});

  List<Widget> fancyCard() {
    List<Widget> fancyCards = [];
    L.miniEvents.forEach((element) {
      fancyCards.add(EventCard(event: element));
    });
    return fancyCards;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/welcomeCarousel/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Mini Events',
            style: GoogleFonts.lexend(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(5),
          children: fancyCard(),
        ),
      ),
    );
  }
}
