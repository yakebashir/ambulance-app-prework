import 'package:flutter/material.dart';

import '../../constants.dart';

class SectionHeading extends StatelessWidget {
  //variable that holds the heading text
  final String text;
  const SectionHeading({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: kBlack,
          fontSize: 18,
        ),
      ),
    );
  }
}
