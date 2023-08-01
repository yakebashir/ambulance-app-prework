import 'package:flutter/material.dart';

import '../constants.dart';

class DistanceAndDurationIconCard extends StatelessWidget {
  final IconData iconData;
  final String text;
  const DistanceAndDurationIconCard({
    required this.iconData,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 90,
      child: Card(
        color: kMainWhite,
        surfaceTintColor: kMainWhite,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Icon(
                iconData,
                color: kMainColor,
                size: 36,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: kMainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
