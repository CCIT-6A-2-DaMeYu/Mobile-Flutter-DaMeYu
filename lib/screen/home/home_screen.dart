import 'package:carousel_slider/carousel_slider.dart';
import 'package:dameyu/screen/chatbot/chatbot_screen.dart';
import 'package:dameyu/theme/theme_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 10,
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.55,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                  ),
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 300,
                        width: 200,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


                     
                  
                     
                     


// import 'package:dameyu/screen/chatbot/chatbot_screen.dart';
// import 'package:dameyu/screen/splash_screen/splash_screen.dart';
// import 'package:dameyu/theme/theme_color.dart';
// import 'package:dameyu/theme/theme_text_style.dart';
// import 'package:dameyu/utils/shared_preferences.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

//   class _HomeScreenState extends State<HomeScreen> {
  
//   // ignore: unused_field
//   // String _username = ""; 

//   @override
//   void initState() {
//     super.initState();
//     // _getUsername().then((username) {
//     //   setState(() {
//     //   _username = username;
//     //   });
//     // });
//   }

//   // Future<String> _getUsername() async {
//   //   final username = await SharedPref().getToken(); 
//   //   return username;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ThemeColor().whiteColor,
//       appBar: AppBar(
//         backgroundColor: ThemeColor().pinkColor,
//         // title: Text(
//         //   'DAMEYU',
//         //   style: ThemeTextStyle().asFilm,
//         // ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Image.asset('assets/chatbotbutton.png'), // Ganti dengan path gambar Anda
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ChatBotScreen()),
//               );
//             },
//           ),
//         ],
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.logout),
//         //     color: ThemeColor().white2Color,
//         //     onPressed: () async {
//         //       Navigator.pushAndRemoveUntil(
//         //             context,
//         //             MaterialPageRoute(
//         //               builder: (_) => const SplashScreen(),
//         //             ),
//         //             (route) => false);
//         //         await SharedPref().removeToken();
             
                
//         //     }
//         //   )
//         // ],
//         shape: const RoundedRectangleBorder (
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(40),
//             bottomRight: Radius.circular(40)
//           )),
//       )
//     );
//   }
// }