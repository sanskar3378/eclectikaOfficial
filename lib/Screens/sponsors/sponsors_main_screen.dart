import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class SponsorsMainScreen extends StatefulWidget {
  const SponsorsMainScreen({super.key});

  @override
  _SponsorsMainScreenState createState() => _SponsorsMainScreenState();
}

class _SponsorsMainScreenState extends State<SponsorsMainScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  List<String> imageList = [
    'asset/sponsors/bench.jpg',
    'asset/sponsors/bhaat.png',
    'asset/sponsors/bhaiya.jpg',
    'asset/sponsors/Grab.png',
    'asset/sponsors/bhuger.png',
    'asset/sponsors/health.png',
    'asset/sponsors/hospital.png',
    'asset/sponsors/janix.jpg',
    'asset/sponsors/magic.jpg',
    'asset/sponsors/newspons5.jpeg.jpg',
    'asset/sponsors/newspons6.jpeg.jpg',
    'asset/sponsors/newspons8.png',
    'asset/sponsors/nit.jpg',
    'asset/sponsors/pixel.jpg',
    'asset/sponsors/salon.jpeg.jpg',
    'asset/sponsors/sjain.jpg',
    'asset/sponsors/spark.jpg',
    'asset/sponsors/stock.jpg',
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
            'Sponsors',
            style: GoogleFonts.carterOne(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          leading: IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              icon: const Icon(Icons.menu_rounded)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.builder(
                itemCount: imageList.length,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageList[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  // Widget item(int index) {
  //   return AnimatedContainer(
  //     height: 100,
  //     width: screenWidth,
  //     curve: Curves.easeInOut,
  //     duration: Duration(milliseconds: 300 + (index * 200)),
  //     transform:
  //         Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
  //     margin: const EdgeInsets.only(
  //       bottom: 12,
  //     ),
  //     padding: EdgeInsets.symmetric(
  //       horizontal: screenWidth / 20,
  //     ),
  //     decoration: BoxDecoration(
  //       color: Color(0xffD7A86E),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           child: Row(
  //             children: [
  //               Center(
  //                 child: CircleAvatar(
  //                   foregroundImage: AssetImage(imageList[index]),
  //                   radius: 40,
  //                 ),
  //               ),
  //               const SizedBox(width: 20),
  //               Column(
  //                 children: [
  //                   SizedBox(
  //                     height: 30,
  //                   ),
  //                   Expanded(
  //                     child: AutoSizeText.rich(
  //                       TextSpan(
  //                         text: texts[index],
  //                         style: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight:
  //                                 FontWeight.bold), // default text style
  //                       ),
  //                       minFontSize: 0,
  //                       stepGranularity: 0.1,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
