import 'package:flutter/material.dart';

import '../models/ambulance_model.dart';
import 'distance_and_duration_value_widget.dart';

class DistanceAndDurationDisplayWidget extends StatelessWidget {
  final Ambulance ambulance;

  const DistanceAndDurationDisplayWidget({
    required this.ambulance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DistanceAndDurationValueWidget(
          ambulance: ambulance,
          iconData: Icons.moving_rounded,
          text: 'Distance',
        ),
        DistanceAndDurationValueWidget(
          ambulance: ambulance,
          iconData: Icons.departure_board_rounded,
          text: 'Arrival Time',
        ),
      ],
    );
  }
}
