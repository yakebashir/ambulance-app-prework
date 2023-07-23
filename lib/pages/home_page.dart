import '../constants.dart';
import 'package:flutter/material.dart';
import '../helpers/ambulance_list_widget.dart';
import '../helpers/user_location_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kVeryLightGrey,
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            UserLocation(),
            SizedBox(height: 20),
            Text(
              'Ambulances near you...',
              style: TextStyle(
                color: kBlack,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            // SizedBox(
            //   height: 0.5,
            //   child: Container(
            //     color: kElectricViolet,
            //   ),
            // ),
            AmbulanceListWidget(),
          ],
        ),
      ),
    );
  }
}
