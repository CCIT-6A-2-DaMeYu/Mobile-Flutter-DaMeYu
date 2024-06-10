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
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 01.0), // Sesuaikan padding sesuai kebutuhan Anda
       
              // width: 00, // Sesuaikan lebar gambar
              // height: 100, // Sesuaikan tinggi gambar
            
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