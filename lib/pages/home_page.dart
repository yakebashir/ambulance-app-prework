import 'package:flutter/material.dart';

import '../constants.dart';
import '../helpers/widgets/ambulance_list_widget.dart';
import '../helpers/widgets/user_location_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kVeryLightGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            UserLocation(),
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
            const AmbulanceListWidget(),
          ],
        ),
      ),
    );
  }
}
