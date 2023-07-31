import 'package:flutter/material.dart';

class DetailsPageSectionHeadingWidget extends StatelessWidget {
  //variable that holds the heading text
  final String text;
  final Color color;
  const DetailsPageSectionHeadingWidget({
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 18,
        ),
      ),
    );
  }
}
