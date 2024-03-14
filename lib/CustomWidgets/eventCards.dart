import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  final Map<String, String> event;
  final imageList = [
    'asset/miniEvents/blue.jpg',
    'asset/miniEvents/green.jpg',
    'asset/miniEvents/orange.jpg',
    'asset/miniEvents/red.jpg',
    'asset/miniEvents/yellow.jpg',
  ];

  final logo = [
    'asset/miniEvents/miniList/abhivyakti.jpg',
    'asset/miniEvents/miniList/blog.jpg',
    'asset/miniEvents/miniList/hansard.png',
    'asset/miniEvents/miniList/olympia.jpg',
    'asset/miniEvents/miniList/paperCostume.jpg',
    'asset/miniEvents/miniList/papertopia.jpg',
    'asset/miniEvents/miniList/quiz.jpg'
  ];

  // var color = Color.fromARGB(255, 37, 84, 160),
  // var color = Color.fromARGB(255, 208, 204, 208),
  // var color = Color.fromARGB(255, 108, 14, 35),
  // var color = Color.fromARGB(255, 254, 247, 73),
  // var color = Color.fromARGB(255, 80, 216, 215),

  EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.aspectRatio;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imageList[Random().nextInt(imageList.length)],
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      left: -2,
                      height: ratio > 0.5 ? 190 : 200,
                      width: ratio > 0.5 ? 140 : 160,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 140,
                              width: 140,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0.0, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    logo[Random().nextInt(logo.length)]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: Container(
                        // color: Colors.black12,s
                        //To decrease bottom of card
                        height: ratio > 0.5 ? 165 : 165,
                        margin: EdgeInsets.only(left: ratio > 0.5 ? 120 : 135),
                        padding: const EdgeInsets.only(bottom: 25, top: 19),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              event["Name of the events"].toString(),
                              maxLines: 2,
                              style: GoogleFonts.asap(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            // AutoSizeText(
                            //   "Time:${"\t" * 3}${event["Time"].toString()}",
                            //   maxLines: 1,
                            //   style: const TextStyle(
                            //     fontSize: 15,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // AutoSizeText(
                            //   "Venue:\t${event["Venue"].toString()}",
                            //   maxLines: 3,
                            //   style: const TextStyle(
                            //     fontSize: 15,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            event["Description "].toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
