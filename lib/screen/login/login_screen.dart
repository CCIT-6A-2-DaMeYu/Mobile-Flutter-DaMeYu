import 'package:dameyu/provider/login_provider.dart';
import 'package:dameyu/screen/home/home_screen.dart';
import 'package:dameyu/theme/theme_text_style.dart';
import 'package:dameyu/utils/shared_preferences.dart';
import 'package:dameyu/widget/login/button_login_widget.dart';
import 'package:dameyu/widget/login/card_widget.dart';
import 'package:dameyu/widget/login/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Scaffold(
        backgroundColor: const Color(0xFFEB6383),
        body: Stack(
          children: [
            Positioned(top: 100, child: filmText()),
            Positioned(bottom: 0, child: card()),
          ],
        ),
      ),
    );
  }

  Widget filmText() {
    return SizedBox(
      width: mediaSize.width,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            "assets/logo.png",
            width: 300,
            height: 300,
          ),
          // const SizedBox(height: 20),
          // Text(
          //   "AS FILM",
          //   style: ThemeTextStyle().asFilm,
          //   ),
        ],
      ),
    );
  }

  Widget card() {
    return SizedBox(
      width: mediaSize.width,
      child: CardWidget(
      child: titleCard(),
      ),
    );
  }

  Widget titleCard() {
  return Consumer<LoginProvider>(
    builder: (context, loginProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome!",
            style: ThemeTextStyle().welcome,
          ),

            const SizedBox(height: 30),
            TextFieldWidget(
              label: 'Username',
              controller: loginProvider.usernameController,
              errorText: loginProvider.messageErrorUsernameValue,
              onChanged: (val) {
                loginProvider.setUsernameValue(val);
                loginProvider.usernameValidator(val);
              },
            ),

            const SizedBox(height: 20),
            TextFieldWidget(
              label: 'Password',
              controller: loginProvider.passwordController,
              errorText: loginProvider.messageErrorPasswordValue,
              isPassword: true,
              onChanged: (val) {
                loginProvider.setPasswordValue(val);
                loginProvider.passwordValidation(val);
              },
            ),

            const SizedBox(height: 30),
            const SizedBox(height: 10),
            
            ButtonLogin(
              title: 'Login',
              onPressed: (loginProvider.usernameValue.isNotEmpty && loginProvider.passwordValue.isNotEmpty)
              ? () async {
              await SharedPref().saveToken(
                loginProvider.usernameController.text,
                loginProvider.passwordController.text,
              );
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          : null,
        ),
        const SizedBox(height: 70),
      ],
    );
    });
  }
}

