import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/MadAds/youtubePlayer.dart';
import '../../Constants/MadAdsLinks.dart';

class MadAdsScreen extends StatelessWidget {
  const MadAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Mad Ads',
            style: GoogleFonts.carterOne(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    ButtonsTabBar(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      backgroundColor: const Color.fromARGB(255, 173, 520, 62),
                      unselectedBackgroundColor:
                          Color.fromARGB(255, 224, 224, 206),
                      labelStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      borderWidth: 1,
                      // unselectedBorderColor: C.vintageBackdrop3,
                      radius: 200,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.slow_motion_video),
                          text: "2023",
                        ),
                        Tab(
                          icon: Icon(Icons.slow_motion_video),
                          text: "2020",
                        ),
                        Tab(
                          icon: Icon(Icons.slow_motion_video),
                          text: "2019",
                        ),
                        Tab(
                          icon: Icon(Icons.slow_motion_video),
                          text: "2018",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(children: videoTabs(year: "2023")),
                          ListView(children: videoTabs(year: "2020")),
                          ListView(children: videoTabs(year: "2019")),
                          ListView(children: videoTabs(year: "2018")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<VideoTab> videoTabs({required String year}) {
  List<VideoTab> videoList = [];
  madAds[year]?.forEach((element) {
    videoList.add(VideoTab(
        img: element['img'],
        link: element['link'],
        desc: element['description'],
        title: element['title']));
  });
  return videoList;
}

class VideoTab extends StatelessWidget {
  String img;
  String link;
  String title;
  String desc;

  VideoTab(
      {required this.img,
      required this.link,
      required this.desc,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 208, 204, 208),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10.0),
      height: height * 0.45,
      width: width,
      child: Stack(
        children: [
          Image.network(
            img,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YoutubeMadAds(link: link)));
                  },
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 80.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Text(
                title,
                maxLines: 1,
                style: GoogleFonts.carterOne(
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 0.01,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  desc,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
