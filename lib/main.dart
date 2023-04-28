import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/views/details_page.dart';
import 'package:pokedex/views/home_page.dart';
import 'package:pokedex/views/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        '/splash': (context) => SplashPage(),
        '/home': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
