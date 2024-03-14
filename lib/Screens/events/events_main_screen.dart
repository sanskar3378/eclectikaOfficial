import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CustomWidgets/button.dart';
import '../../Constants/strings.dart';

class EventMainScreen extends StatefulWidget {
  const EventMainScreen({super.key});

  @override
  _EventMainScreenState createState() => _EventMainScreenState();
}

class _EventMainScreenState extends State<EventMainScreen> {
  final LinearGradient _gradient = LinearGradient(colors: [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.grey[800]!,
    Colors.deepPurple[200]!,
    Colors.white,
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 136, 42, 30),
            Color.fromARGB(255, 145, 48, 37),
            Color.fromARGB(255, 157, 61, 47),
            Color.fromARGB(255, 182, 88, 76),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return _gradient.createShader(rect);
              },
              child: Text(
                'ECLECTIKA',
                style: GoogleFonts.carterOne(fontSize: 45, color: Colors.white),
              ),
            ),
          ),
          leading: IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset(
                  "asset/menu/megaEvent.jpeg",
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(children: [
                const SizedBox(
                  height: 55,
                ),
                FormButton(
                    isGradient: false,
                    title: 'Mega Events',
                    fillColor: Colors.blue[900]!,
                    borderColor: Colors.white,
                    onClick: () {
                      Navigator.pushNamed(context, S.routeMegaEvents);
                    }),
                const SizedBox(
                  height: 15,
                ),
                FormButton(
                    isGradient: false,
                    title: 'Mini Events',
                    fillColor: Colors.green[800]!,
                    borderColor: Colors.white,
                    onClick: () {
                      Navigator.pushNamed(context, S.routeMiniEvents);
                    }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
