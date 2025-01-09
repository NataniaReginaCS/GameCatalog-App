import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gamecatalog/user/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset(
              'images/Vector/icon_GameKatalog.png',
            ),
            splashIconSize: 300,
            nextScreen: Login(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color(0xFF15244D)));
  }
}
