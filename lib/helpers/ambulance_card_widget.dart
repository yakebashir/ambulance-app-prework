import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/ambulance_model.dart';

class AmbulanceCard extends StatelessWidget {
  const AmbulanceCard({
    super.key,
    required this.ambulance,
  });
  //ambulance object
  final Ambulance ambulance;

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 5,
      color: kWhite,
      surfaceTintColor: kWhite,
      //shadowColor: kElectricViolet,
      child: ListTile(
        leading: Image(
          image: AssetImage(ambulance.image),
          height: 50,
          width: 50,
        ),
        title: Text(ambulance.hospitalName),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ambulance.district,
                style: const TextStyle(color: kGrey),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_border_rounded,
                  color: kGold,
                ),
                Text(ambulance.rating.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
