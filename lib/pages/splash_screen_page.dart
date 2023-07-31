import 'package:ambulance/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  static const String routeName = '/';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
    );
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.routeName,
        (route) => false,
      );
    }
  }

  @override
  //Splash screen lacking an image
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text('Ambulance',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kWhite,
            )),
      ),
    );
  }
}
