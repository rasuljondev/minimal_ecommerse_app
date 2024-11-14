import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_ecommerse_app/pages/intro_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: Column(
              children: [
                LottieBuilder.asset("assets/anim/cart_animation.json"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Online Shop',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
      nextScreen: const IntroPage(),
      splashIconSize: 400,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
