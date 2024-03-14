import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeMadAds extends StatefulWidget {
  String link;
  YoutubeMadAds({Key? key, required this.link}) : super(key: key);

  @override
  _YoutubeMadAdsState createState() => _YoutubeMadAdsState(link: link);
}

class _YoutubeMadAdsState extends State<YoutubeMadAds> {
  String link;
  _YoutubeMadAdsState({required this.link});
  late YoutubePlayerController Control;

  @override
  void initState() {
    Control = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(link)!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/welcomeCarousel/background.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
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
        // backgroundColor: C.vintageBackdrop4,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: Control,
                ),
                builder: (context, player) => Center(
                  child: player,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
