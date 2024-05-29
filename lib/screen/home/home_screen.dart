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
  
  // ignore: unused_field
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
      appBar: AppBar(
        backgroundColor: ThemeColor().pinkColor,
        title: Text(
          'DAMEYU',
          style: ThemeTextStyle().asFilm,
        ),
        centerTitle: true,
        actions: [
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
          )
        ],
      )
    );
  }
}