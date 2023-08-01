import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/ambulance_model.dart';
import 'details_page_section_heading_widget.dart';
import 'driver_details_display_widget.dart';

class AmbulanceDetailsPageFooterWidget extends StatelessWidget {
  final Ambulance ambulance;
  const AmbulanceDetailsPageFooterWidget({
    required this.ambulance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const DetailsPageSectionHeadingWidget(
              text: 'Driver Information',
              color: kMainComplementaryColor,
            ),
            const SizedBox(height: 15),
            Expanded(
                child: Column(
              children: [
                DriverDetailsDisplayWidget(
                  estimate: 'Name',
                  valueWithUnits: ambulance.driver.gender,
                  textColor: kMainDarkColor,
                  shape: nameCardShape,
                ),
                DriverDetailsDisplayWidget(
                  estimate: 'Gender',
                  valueWithUnits: ambulance.driver.gender,
                  textColor: kMainDarkColor,
                  shape: genderCardShape,
                ),
                DriverDetailsDisplayWidget(
                  estimate: 'Phone number',
                  valueWithUnits: ambulance.driver.airtelNumber,
                  textColor: kMainDarkColor,
                  shape: phoneNumberCardShape,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

const nameCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(
      30,
    ),
    topRight: Radius.circular(
      30,
    ),
  ),
);

const genderCardShape = RoundedRectangleBorder(borderRadius: BorderRadius.zero);

const phoneNumberCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(
      30,
    ),
    bottomRight: Radius.circular(
      30,
    ),
  ),
);
