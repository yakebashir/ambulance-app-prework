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
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: kGrey,
          fontSize: 18,
          decoration: TextDecoration.underline,
          decorationColor: kGrey,
          decorationStyle: TextDecorationStyle.wavy,
          decorationThickness: 1.5,
        ),
      ),
    );
  }
}
