import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/ambulance_model.dart';

class SingleAmbulanceDisplayWidget extends StatelessWidget {
  const SingleAmbulanceDisplayWidget({
    super.key,
    required this.ambulance,
  });
  //ambulance object
  final Ambulance ambulance;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kRoundedBorderRadius),
          bottomRight: Radius.circular(kRoundedBorderRadius),
        ),
      ),
      elevation: 5,
      color: kMainWhite,
      surfaceTintColor: kMainWhite,
      shadowColor: kMainTintColor,
      child: ListTile(
        leading: const Image(
          image: AssetImage('images/medical.png'),
          height: 50,
          width: 50,
        ),
        title: Text(
          ambulance.hospital.name,
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ambulance.hospital.district,
                style: TextStyle(color: kMainGrey),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.moving_rounded,
                  color: kMainColor,
                ),
                Text(
                  ambulance.distance.text,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
