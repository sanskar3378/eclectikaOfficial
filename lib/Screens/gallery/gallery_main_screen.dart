import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:eclectika23_official_app/Constants/eventsList.dart';
import 'package:eclectika23_official_app/CustomWidgets/customCardsb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class GalleryMainScreen extends StatefulWidget {
  const GalleryMainScreen({Key? key}) : super(key: key);

  @override
  _GalleryMainScreenState createState() => _GalleryMainScreenState();
}

class _GalleryMainScreenState extends State<GalleryMainScreen> {
  final AppinioSwiperController controller = AppinioSwiperController();
  List<Widget> fancyCard(BuildContext context) {
    List<Widget> fancyCards = [];
    L.galleryEvents.forEach((element) {
      fancyCards.add(
        FancyCardb(
          image: Image.asset(element["Image"].toString()),
          text: element["Name of the events"].toString(),
        ),
      );
    });
    return fancyCards;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/welcomeCarousel/background.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Gallery',
            style: GoogleFonts.carterOne(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          leading: IconButton(
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            StackedCardCarousel(
              items: fancyCard(context),
            ),
          ],
        ),
      ),
    );
  }
}
