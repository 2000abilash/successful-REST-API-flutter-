
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'loginscreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
            splash: Container(
              height: 2000,
              width: 400,
              child: Lottie.asset("assets/images/welcome_lottie.json",
              fit: BoxFit.cover
              ),
            ),
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.sizeTransition,
      animationDuration:Duration(milliseconds: 1300),
    );
  }
}
