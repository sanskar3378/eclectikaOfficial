import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamMainScreen extends StatefulWidget {
  const TeamMainScreen({Key? key}) : super(key: key);

  @override
  _TeamMainScreenState createState() => _TeamMainScreenState();
}

class _TeamMainScreenState extends State<TeamMainScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  List<String> names = [
    "Pallavi Sudhaker ",
    "Jeevan Kishore Neyyala",
    "P. Sunil Kumar",
    "Singamsetty Akhil",
    "Suraj Kumar Yadav ",
    "Samshitha Reddy Karra ",
    "Hari Bhargav Sai Popuri",
    "Nithin Siddala",
    "Banavath Susheel Kumar ",
    "Surabhi Singh ",
    "Vishal Singh ",
    "Shubhanshu Shubham ",
    "Mayank Bhardwaj ",
    "Neha yednurwar",
    "Harsha Raj",
    "S. Sri Vikram",
  ];

  List<String> imageList = [
    "asset/team/pallavi_sudhaker.jpg",
    "asset/team/jeevan_kishore_neyyala.jpg",
    "asset/team/sunil.jpg",
    "asset/team/singamsetty_akhil.png",
    "asset/team/suraj_kumar_yadav.jpg",
    "asset/team/samshitha.jpg",
    "asset/team/hari_bhargav_sai_popuri.jpg",
    "asset/team/nithin_siddala.jpg",
    "asset/team/banavath_susheel_kumar.jpg",
    "asset/team/surabhi_singh.jpg",
    "asset/team/vishal_singh.jpg",
    "asset/team/shubhanshu_shubham.jpg",
    "asset/team/mayank.jpg",
    "asset/team/neha_yednurwar.jpg",
    "asset/team/harsha_raj.jpg",
    "asset/team/sri_vikram.jpg",
  ];

  List<String> roles = [
    "Creatives",
    "Creatives",
    "Design and Video Editing",
    "Documenation",
    "Event Management",
    "Event Management",
    "Event Management",
    "Event Management",
    "Public Relations",
    "Public Relations",
    "Public Relations",
    "Sponsorship",
    "Sponsorship",
    "Web and App Developer",
    "Event Management",
    "Event Management",
  ];
  List<String> branch = [
    "ARCH.",
    "MECH",
    "MECH",
    "CHEM",
    "MCA",
    "ELECTRICAL",
    "CSE",
    "BIOTECH",
    "MECHANICAL",
    "MME",
    "CIVIL",
    "CHEMICAL",
    "BIOTECH",
    "MINING",
    "Mechanical",
    "Mechanical",
  ];

  List<String> contact = [
    "7489612817",
    "9133756756",
    "7981224796",
    "6304859705",
    "8418034135",
    "8519955478",
    "8919383293",
    "7330976018",
    "9848139264",
    "9685305025",
    "6204915772",
    "6263639776",
    "9634653572",
    "9370672015",
    "9634653572",
    "9370672015",
  ];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
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
          centerTitle: true,
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
          leading: IconButton(
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.17,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 25,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return item(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "'Developed by : Sanskar Thengare'",
                style: GoogleFonts.lexend(color: Colors.white, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    print('Screen width = ${screenWidth}');
    return AnimatedContainer(
      height: 150,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 198, 224, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            foregroundImage: AssetImage(imageList[index]),
            radius: 55,
          ),
          SizedBox(
            width: screenWidth / 25,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenWidth / 51),
                AutoSizeText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: names[index],
                    style: TextStyle(
                      fontSize: screenWidth / 20,
                      fontWeight: FontWeight.w500,
                    ), // default text style
                  ),
                  minFontSize: 0,
                  stepGranularity: 0.1,
                ),
                AutoSizeText.rich(
                  TextSpan(
                    text: branch[index],
                    style: TextStyle(
                      fontSize: screenWidth / 30,
                      fontWeight: FontWeight.w500,
                    ), // default text style
                  ),
                  minFontSize: 0,
                  stepGranularity: 0.1,
                ),
                AutoSizeText.rich(
                  TextSpan(
                    text: roles[index],
                    style: TextStyle(
                      fontSize: screenWidth / 30,
                      fontWeight: FontWeight.w500,
                    ), // default text style
                  ),
                  minFontSize: 0,
                  stepGranularity: 0.1,
                ),
                // AutoSizeText.rich(
                //   TextSpan(
                //     text: contact[index],
                //     style: TextStyle(
                //       fontSize: screenWidth / 22,
                //       fontWeight: FontWeight.w500,
                //     ), // default text style
                //   ),
                //   minFontSize: 0,
                //   stepGranularity: 0.1,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
