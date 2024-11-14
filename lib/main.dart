import 'package:flutter/material.dart';
import 'package:minimal_ecommerse_app/models/shop.dart';
import 'package:minimal_ecommerse_app/pages/cart_page.dart';
import 'package:minimal_ecommerse_app/pages/intro_page.dart';
import 'package:minimal_ecommerse_app/components/light_mode.dart';
import 'package:minimal_ecommerse_app/pages/shop_page.dart';
import 'package:minimal_ecommerse_app/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: lightMode,
        routes: {
          '/intro_page': (context) => const IntroPage(),
          '/shop_page': (context) => const ShopPage(),
          '/cart_page': (context) => const CartPage(),
        });
  }
}
