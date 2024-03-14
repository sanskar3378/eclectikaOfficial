import 'package:eclectika23_official_app/Screens/events/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../../Constants/eventsList.dart';
import '../../CustomWidgets/customCards.dart';

class MegaEventScreen extends StatefulWidget {
  MegaEventScreen({super.key});

  @override
  State<MegaEventScreen> createState() => _MegaEventScreenState();
}

var imageList = [
  'asset/welcomeCarousel/1.png',
  'asset/welcomeCarousel/2.png',
  'asset/welcomeCarousel/3.png',
  'asset/welcomeCarousel/4.png',
  'asset/welcomeCarousel/5.png',
];

class _MegaEventScreenState extends State<MegaEventScreen> {
  final _controller = SwipableStackController();

  @override
  List<Widget> fancyCard(BuildContext context) {
    List<Widget> fancyCards = [];
    L.megaEvents.forEach((element) {
      fancyCards.add(
        FancyCard(
            image: Image.asset(element["Image"].toString()),
            title: element["Name of the events"].toString(),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EventDetailScreen(element: element)))),
      );
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
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            'Mega Events',
            style: GoogleFonts.lexend(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SwipableStack(
              controller: _controller,
              builder: (context, i) {
                return fancyCard(
                    context)[(i.index % fancyCard(context).length)];
              },
            )
          ],
        ),
      ),
    );
  }
}
