import 'dart:async';
import 'dart:ui'; // For ImageFilter
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Lottie animation package

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // Automatically hide after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop(); // Pop the loading screen after 3 seconds
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Transparent background
      body: Stack(
        children: [
          // Full-screen blurred background
          Positioned.fill(
            child: Container(
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                child: Container(
                  color: Colors.transparent, // Ensure transparency
                ),
              ),
            ),
          ),
          // Centered Lottie animation
          Center(
            child: Lottie.asset(
              'assets/anim/ball_cart.json', // Path to your Lottie animation
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

// 'assets/anim/ball_cart.json'