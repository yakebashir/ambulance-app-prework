import '../constants.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kViolet,
    );
  }
}
