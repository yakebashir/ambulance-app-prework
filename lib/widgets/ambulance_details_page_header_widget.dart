import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/ambulance_model.dart';

class AmbulanceDetailsPageHeaderWidget extends StatelessWidget {
  const AmbulanceDetailsPageHeaderWidget({
    super.key,
    required this.ambulance,
  });

  final Ambulance ambulance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: const BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            kRoundedBorderRadius,
          ),
          bottomRight: Radius.circular(
            kRoundedBorderRadius,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kVerticalPadding,
          horizontal: kHorizontalPadding,
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.zero, // To remove the default padding around ListTile
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ambulance.hospital.name,
                style: const TextStyle(
                  fontSize: 28,
                  color: kMainWhite,
                ),
              ),
              Align(
                child: Text(
                  ambulance.hospital.district,
                  style: const TextStyle(
                    color: kMainTintColor,
                  ),
                ),
              ),
              const Image(
                image: AssetImage('images/medical.png'),
                height: 50,
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
