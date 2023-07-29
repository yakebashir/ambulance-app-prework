import 'package:ambulance/widgets/user_location_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomePageBodyWidget extends StatelessWidget {
  final Widget listToDisplay;
  const HomePageBodyWidget({
    required this.listToDisplay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        UserLocation(
          context: context,
        ),
        const SizedBox(height: 20),
        const Text(
          'Ambulances near you...',
          style: TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        listToDisplay,
      ],
    );
  }
}
