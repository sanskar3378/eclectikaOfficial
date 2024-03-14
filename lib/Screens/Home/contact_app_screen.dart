import 'package:eclectika23_official_app/CustomWidgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactAppScreen extends StatefulWidget {
  const ContactAppScreen({super.key});

  @override
  State<ContactAppScreen> createState() => _ContactAppScreenState();
}

class _ContactAppScreenState extends State<ContactAppScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/welcomeCarousel/background.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              'Our Team',
              style: GoogleFonts.lexend(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 20,
                ),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    ProfileCard(
                      name: "Kumar Utsav",
                      domain: "Associate Coordinator",
                      post: "App Developer",
                      number: "7250241229",
                      profileimage:
                          "https://thewire.in/wp-content/uploads/2016/04/CHAKRA-IMAGE02.jpg",
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ProfileCard(
                      name: "Arko Bandyopadhyay",
                      domain: "Associate Coordinator",
                      post: "App Developer",
                      number: "8349214046",
                      profileimage:
                          "https://assetsio.reedpopcdn.com/377815386_869093058118722_2843615067176350660_n.jpg?width=1200&height=1200&fit=crop&quality=100&format=png&enable=upscale&auto=webp",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
