import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/events/events_screen.dart';
import '../../Screens/gallery/gallery_screen.dart';
import '../../Screens/sponsors/sponsors_screen.dart';
import '../../Screens/team/team_screen.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // Custom Gesture detector

  Widget customGesture(
      BuildContext context, Widget route, Widget customWidget) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return route;
            }),
          ),
        );
      },
      child: customWidget,
    );
  }

  // Custom drawer button

  Widget customConatiner(String title) {
    return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 230, 167),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Container(
                width: 200.0,
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: AutoSizeText.rich(
                            TextSpan(
                              text: "Eclectika",
                              style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontSize: 32,
                              ), // default text style
                            ),
                            minFontSize: 0,
                            stepGranularity: 0.1,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(height: 10),
                        customGesture(
                          context,
                          const EventsScreen(),
                          customConatiner('Events'),
                        ),

                        // customGesture(
                        //   context,
                        //   const MadAdsScreen(),
                        //   customConatiner('MadAds'),
                        // ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        customGesture(
                          context,
                          const GalleryScreen(),
                          customConatiner('Gallery'),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        customGesture(
                          context,
                          const SponsorsScreen(),
                          customConatiner('Sponsors'),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: customConatiner('Home'),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        customGesture(
                          context,
                          const TeamScreen(),
                          customConatiner('Our Team'),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
