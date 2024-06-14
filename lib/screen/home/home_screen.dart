import 'package:carousel_slider/carousel_slider.dart';
import 'package:dameyu/screen/chatbot/chatbot_screen.dart';
import 'package:dameyu/screen/splash_screen/splash_screen.dart';
import 'package:dameyu/theme/theme_color.dart';
import 'package:dameyu/theme/theme_text_style.dart';
import 'package:dameyu/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username = "";

  @override
  void initState() {
    super.initState();
    _getUsername().then((username) {
      setState(() {
        _username = username;
      });
    });
  }

  Future<String> _getUsername() async {
    final username = await SharedPref().getToken();
    return username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: ThemeColor().pinkColor,
          centerTitle: true,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/logo2.png',
            ),
          ),
          actions: [
            
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Image.asset('assets/chatbotbutton.png'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatBotScreen()),
                  );
                },
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Welcome! $_username',
                style: ThemeTextStyle().welcomeUsername,
              ),
            ),
            IconButton(
            icon: const Icon(Icons.logout),
            color: ThemeColor().white2Color,
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SplashScreen(),
                    ),
                    (route) => false);
                await SharedPref().removeToken();
            }
          ),
            // const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: 10,
                options: CarouselOptions(
                  height: 130,
                  autoPlay: true,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: const Color(0xFFF68787),
                    ),
                  );
                },
              ),
            ),
             const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}