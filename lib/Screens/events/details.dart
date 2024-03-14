import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailScreen extends StatelessWidget {
  EventDetailScreen({super.key, required this.element});
  Map<String, String> element;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/welcomeCarousel/background.png'),
              fit: BoxFit.cover),
          color: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            element["Name of the events"].toString(),
            style: GoogleFonts.acme(
              fontSize: 45,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          // color: Colors.amber,
          height: height,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(element["Image"].toString()),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(element["Description "].toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sen(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                      element['date']! == " "
                          ? " "
                          : "Date : ${element['date']}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sen(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                // const SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.all(2.0),
                //   child: Text("Venue: ${element["Venue"].toString()}",
                //       style: GoogleFonts.sen(
                //           fontSize: 20.0,
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold)),
                // ),
                // Align(
                //     alignment: Alignment.center,
                //     child: Text("Time: ${element["Time"].toString()}",
                //         textAlign: TextAlign.center,
                //         style: GoogleFonts.sen(
                //             fontSize: 20.0,
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold))),
                const SizedBox(height: 20),
                // InkWell(
                //   splashFactory: InkSparkle.splashFactory,
                //   onTap: () {},
                //   // splashColor: Colors.white,
                //   child: Ink(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: const Color.fromARGB(255, 140, 72, 67),
                //     ),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       height: height / 19,
                //       width: width / 2,
                //       child: Center(
                //           child: Text(
                //         'REGISTER',
                //         style: GoogleFonts.acme(
                //           fontSize: 30,
                //           color: Colors.white,
                //         ),
                //       )),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
