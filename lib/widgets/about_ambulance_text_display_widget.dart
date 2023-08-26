import 'package:ambulance/constants.dart';
import 'package:flutter/material.dart';

import '../../models/ambulance_model.dart';

class AboutAmbulanceTextDisplayWidget extends StatelessWidget {
  const AboutAmbulanceTextDisplayWidget({
    super.key,
    required this.maxLinesNotifier,
    required this.ambulance,
  });

  //variable that determines how many lines of the ambulance details are displayed
  final ValueNotifier<int> maxLinesNotifier;
  //ambulance object
  final Ambulance ambulance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: maxLinesNotifier,
          builder: (context, value, child) {
            return Text(
              ambulance.details,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: kMainBlack,
              ),
              maxLines: value,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
        GestureDetector(
          onTap: () {
            if (maxLinesNotifier.value == 2) {
              maxLinesNotifier.value = 10;
            } else {
              maxLinesNotifier.value = 2;
            }
          },
          child: ValueListenableBuilder<int>(
            valueListenable: maxLinesNotifier,
            builder: ((context, value, child) {
              return Text(
                value <= 2 ? 'Read more...' : 'Show less',
                style: TextStyle(
                  color: kMainGrey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
