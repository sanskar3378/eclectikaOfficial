import 'package:eclectika23_official_app/CustomWidgets/screen_background.dart';
import 'package:eclectika23_official_app/Screens/Welcome/network.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CustomWidgets/button.dart';
import '../../CustomWidgets/customBanner.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 11;

    List<Widget> listBanners = [
      customBanner(
          imagePath: 'asset/welcomeCarousel/ironman.jpg',
          bgPath: 'asset/welcomeCarousel/welcome1.jpg',
          text: '${S.text1[0]}',
          height: height,
          width: width),
      customBanner(
          imagePath: 'asset/welcomeCarousel/captain america.jpg',
          bgPath: 'asset/welcomeCarousel/background.png',
          text: '${S.text1[1]}',
          height: height,
          width: width),
    ];

    return Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
            const ScreenBackground(),
            InitialPage(height: height, listBanners: listBanners),
          ],
        ));
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({
    Key? key,
    required this.height,
    required this.listBanners,
  }) : super(key: key);

  final double height;
  final List<Widget> listBanners;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int current = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5.0),
            Center(
              child: Text(
                "ECLECTIKA'23",
                style: GoogleFonts.bebasNeue(fontSize: 64, color: Colors.white),
              ),
            ),
            const SizedBox(height: 0),
            SizedBox(
              height: widget.height * 0.72,
              child: PageView(
                onPageChanged: (int index) {
                  current = index;
                },
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: widget.listBanners,
              ),
            ),
            const SizedBox(height: 5),
            //Bottom buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  title: "Skip",
                  fillColor: const Color.fromARGB(255, 139, 7, 6),
                  borderColor: Colors.white,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FinalPage()),
                    );
                  },
                ),
                CustomButton(
                  title: "Next",
                  fillColor: const Color.fromARGB(255, 0, 46, 94),
                  borderColor: Colors.white,
                  onClick: () {
                    if (_pageController.hasClients) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    }
                    if (current >= 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinalPage()),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FinalPage extends StatelessWidget {
  FinalPage({Key? key}) : super(key: key);
  SkipLogin skipLogin = SkipLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // const ScreenBackground(),
          Image.asset(
            'asset/welcomeCarousel/finalPage_image0.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15.0),
                //   child: Image.asset(
                //     'asset/welcomeCarousel/ironman.jpg',
                //     fit: BoxFit.cover,
                //   ),
                // ),
                const SizedBox(
                  height: 15.0,
                ),
                Text("ECLECTIKA",
                    style: GoogleFonts.titanOne(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
                Center(
                  child: Text(
                    "The Cultural Event at NIT Raipur",
                    style: GoogleFonts.sen(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Center(
                    child: Text("---Register to Continue---",
                        style: GoogleFonts.alata(
                            fontSize: 20.0, color: Colors.white))),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    FormButton1(
                        title: 'Signup',
                        fillColor: Colors.red[700]!,
                        borderColor: Colors.yellow,
                        onClick: () {
                          Navigator.pushReplacementNamed(
                              context, S.routeSignup);
                        }),
                    FormButton1(
                        title: 'Login',
                        fillColor: Colors.blue[800]!,
                        borderColor: Colors.white,
                        onClick: () {
                          Navigator.pushReplacementNamed(context, S.routeLogin);
                        }),
                  ],
                ),
                FormButton(
                  isGradient: true,
                  title: 'Continue as Guest',
                  fillColor: Colors.greenAccent[400]!,
                  borderColor: Colors.white,
                  onClick: () async {
                    await skipLogin.welcome(
                        emailAddress: "dinosaur@eclectika.com",
                        password: "dinosaur2023");
                    Navigator.pushReplacementNamed(context, S.routeSplash);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
