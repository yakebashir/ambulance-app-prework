import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/ambulance_model.dart';
import 'distance_and_duration_icon_card.dart';

class DistanceAndDurationValueWidget extends StatelessWidget {
  const DistanceAndDurationValueWidget({
    super.key,
    required this.ambulance,
    required this.iconData,
    required this.text,
  });

  final Ambulance ambulance;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          elevation: 10,
          color: kWhite,
          surfaceTintColor: kWhite,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    text == 'Distance'
                        ? ambulance.distance.text
                        : ambulance.duration.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: kRedShade,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              DistanceAndDurationIconCard(
                iconData: iconData,
                text: text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
