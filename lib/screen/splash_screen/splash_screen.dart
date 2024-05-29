import 'package:dameyu/model/user_model.dart';
import 'package:dameyu/provider/user_provider.dart';
import 'package:dameyu/screen/home/home_screen.dart';
import 'package:dameyu/screen/login/login_screen.dart';
import 'package:dameyu/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEB6383),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 800,
              height: 800,
            ),
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                // Di sini kita memeriksa status login menggunakan UserProvider
                checkLogin(context, userProvider);
                return const SizedBox(); // Ini akan menghilangkan indikator loading.
              },
            ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext context, UserProvider userProvider) async {
    String token = await SharedPref().getToken();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (token.isNotEmpty) {
          userProvider.setUser(UserModel(token));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      },
    );
  }
}
