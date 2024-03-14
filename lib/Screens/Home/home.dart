import 'package:awesome_icons/awesome_icons.dart';
import 'package:eclectika23_official_app/CustomWidgets/button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eclectika23_official_app/CustomWidgets/frostedGlass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../../Constants/strings.dart';
import '../../CustomWidgets/loadingWidget.dart';
import '../../Modals/users.dart';
import '../../constants/colors.dart';

import 'cubit/homeCubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _advancedDrawerController = AdvancedDrawerController();
  UserProfile? userProfile;

  @override
  void initState() {
    _getProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
        if (state is HomeError) {
          print('oh no');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
              style: const TextStyle(color: C.gradientColor3),
            ),
            backgroundColor: C.fieldColor,
          ));
        }
        if (state is HomeSuccess) {
          print('fuck');
          userProfile = state.userProfile;
        }
      }, builder: (context, state) {
        return Stack(
          children: [
            if (state is HomeLoading)
              _buildLoading(context)
            else
              _buildSuccess(context, width, height),
          ],
        );
      }),
    );
  }

  Widget _buildSuccess(BuildContext context, width, height) {
    final LinearGradient _gradient = LinearGradient(colors: [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.grey[800]!,
      Colors.deepPurple[200]!,
      Colors.white,
    ]);

    final Uri linkedIn =
        Uri.parse('https://www.linkedin.com/company/eclectika-nitrr/');
    final Uri insta = Uri.parse('https://www.instagram.com/eclectika_nitrr/');
    final Uri twitter = Uri.parse('https://x.com/eclectika_nitrr?s=20');

    Future<void> _launchURL(String url) async {
      final Uri uri = Uri(scheme: "https", host: url);
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw "cannot launch url";
      }
    }

    return AdvancedDrawer(
      backdrop: Image.asset(
        'asset/menu/drawerBackground.png',
        fit: BoxFit.cover,
        height: double.infinity,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.black,
          iconColor: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 158, 197, 171),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    S.profile,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.person,
                  size: 30,
                ),
                title: Text(userProfile!.name,
                    style: GoogleFonts.lexend(
                        fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.phone,
                  size: 30,
                ),
                title: Text(
                  userProfile!.contactNumber,
                  style: GoogleFonts.lexend(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.email,
                  size: 30,
                ),
                title: Text(userProfile!.email,
                    style: GoogleFonts.lexend(
                        fontSize: 17.0, fontWeight: FontWeight.bold)),
              ),
              // const SizedBox(height: 280),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(insta);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.instagram,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      launchUrl(linkedIn);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.linkedinIn,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: Image.asset('asset/logo/x-twitter.png', height: 28),
                    onTap: () {
                      launchUrl(twitter);
                    },
                  ),
                ],
              ),
              // const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text(
                    'Terms of Service | Privacy Policy',
                    style: GoogleFonts.lexend(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Container(
        color: const Color(0xff0E0207),
        width: width,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: Center(
                    child: Image.asset(
                      "asset/welcomeCarousel/background.png",
                      height: height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 200),
                  width: width,
                  height: height,
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      MenuButton(
                          onTap: () =>
                              Navigator.pushNamed(context, S.routeEvents),
                          width: width,
                          tag: "Events",
                          imgPath: S.events),
                      MenuButton(
                          onTap: () =>
                              Navigator.pushNamed(context, S.routeSponsors),
                          width: width,
                          tag: "Sponsors",
                          imgPath: S.sponsor),
                      // MenuButton(
                      //     onTap: () =>
                      //         Navigator.pushNamed(context, S.routeMadAds),
                      //     width: width,
                      //     tag: "Mad Ads",
                      //     imgPath: "asset/menu/mad_ads.jpg"),
                      MenuButton(
                          onTap: () =>
                              Navigator.pushNamed(context, S.routeGallery),
                          width: width,
                          tag: "Gallery",
                          imgPath: "asset/menu/gallery.jpg"),
                      MenuButton(
                          onTap: () =>
                              Navigator.pushNamed(context, S.routeTeam),
                          width: width,
                          tag: "Our Team",
                          imgPath: "asset/menu/aboutUs.jpg"),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: _handleMenuButtonPressed,
                            icon: ValueListenableBuilder<AdvancedDrawerValue>(
                              valueListenable: _advancedDrawerController,
                              builder: (_, value, __) {
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 250),
                                  child: Icon(
                                    value.visible ? Icons.clear : Icons.person,
                                    color: C.vintageBackdrop1,
                                    size: 30.0,
                                    key: ValueKey<bool>(value.visible),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              print(FirebaseAuth.instance.currentUser);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, S.routeSplash);
                            },
                            icon: const Icon(
                              Icons.logout_rounded,
                              color: C.vintageBackdrop1,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FrostedGlassBox1(
                        theWidth: width,
                        theChild: Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect rect) {
                                return _gradient.createShader(rect);
                              },
                              child: Text(
                                'ECLECTIKA',
                                style: GoogleFonts.carterOne(
                                    fontSize: 55, color: Colors.white),
                              ),
                            ),
                            Text(
                              'Unleash D Unstoppable',
                              style: GoogleFonts.teko(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            // GradientText(
                            //   "ECLECTIKA",
                            //   gradient: LinearGradient(
                            //     colors: [
                            //       Colors.red,
                            //       Colors.yellow,
                            //       Colors.blue,
                            //       Colors.green,
                            //       Colors.grey[800]!,
                            //       Colors.deepPurple[900]!,
                            //       Colors.white,
                            //     ],
                            //     begin: Alignment.topLeft,
                            //     end: Alignment.bottomRight,
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 5.0,
                            // ),
                            // RichText(
                            //   text: const TextSpan(
                            //     text: "Unleash The ",
                            //     style: TextStyle(
                            //         color: Color(0xffCA965C), fontSize: 24),
                            //     children: <TextSpan>[
                            //       TextSpan(
                            //           text: 'Unstoppable',
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: C.buttonColor)),
                            //     ],
                            //   ),
                            // ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const LoadingScreen();
  }

  void _getProfile(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    cubit.getUser();
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class videoPlayer extends StatelessWidget {
  const videoPlayer({
    Key? key,
    required VideoPlayerController controller,
  })  : _controller = controller,
        super(key: key);

  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}
