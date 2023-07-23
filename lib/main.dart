import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
import 'pages/home_page.dart';
import 'pages/splash_screen_page.dart';

void main() {
  // Set the status bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kViolet,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//This is my first comment!

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreenPage.routeName: (context) => const SplashScreenPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kViolet),
        useMaterial3: true,
      ),
      //Added home property
      initialRoute: HomePage.routeName,
    );
  }
}
