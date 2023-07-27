import 'package:flutter/material.dart';

import '../constants.dart';
import '../helpers/widgets/row_display_text_widget.dart';
import '../helpers/widgets/call_ambulance_button.dart';
import '../helpers/widgets/details_widget.dart';
import '../helpers/widgets/section_heading_widget.dart';
import '../helpers/widgets/spaced_divider_widget.dart';
import '../models/ambulance_model.dart';

class AmbulanceDetailsPage extends StatelessWidget {
  //ambulance object
  final Ambulance ambulance;

  AmbulanceDetailsPage({
    required this.ambulance,
    Key? key, // Added the missing key parameter here
  }) : super(key: key); // Fixed the constructor definition here

  static const String routeName = '/ambulanceDetailsPage';

  final ValueNotifier<int> maxLinesNotifier = ValueNotifier(2);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kVeryLightGrey,
        appBar: AppBar(
          backgroundColor: kEngineeringOrange,
          leading: IconButton(
            color: kWhite,
            highlightColor: kDarkEngineeringOrange,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          title: const Center(
            child: Text(
              'Ambulance Details',
              style: TextStyle(
                color: kWhite,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    color: kEngineeringOrange,
                    borderRadius: BorderRadius.only(
                      //bottomLeft: Radius.circular(kRoundedBorderRadius),
                      bottomRight: Radius.circular(kRoundedBorderRadius),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kVerticalPadding,
                      horizontal: kHorizontalPadding,
                    ),
                    child: Column(
                      children: [
                        Text(
                          ambulance.hospital.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kWhite,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          ambulance.hospital.district,
                          style: const TextStyle(color: kGrey),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.moving,
                              color: kGold,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              ambulance.distance.text,
                              style: const TextStyle(color: kWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                    //vertical: kVerticalPadding,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SpacedDivider(),
                      const SectionHeading(text: 'About'),
                      const SizedBox(height: 20),
                      DetailsWidget(
                        maxLinesNotifier: maxLinesNotifier,
                        ambulance: ambulance,
                      ),
                      const SizedBox(height: 30),
                      RowDisplayTextWidget(
                        estimate: 'Estimated Distance',
                        valueWithUnits: ambulance.distance.text,
                      ),
                      const SizedBox(height: 10),
                      RowDisplayTextWidget(
                        estimate: 'Estimated arrival time',
                        valueWithUnits: ambulance.duration.text,
                      ),
                      const SpacedDivider(),
                      const SectionHeading(text: 'Driver Information'),
                      const SizedBox(height: 20),
                      const RowDisplayTextWidget(
                        estimate: 'Name',
                        valueWithUnits: 'Richard Lee',
                      ),
                      const RowDisplayTextWidget(
                        estimate: 'Gender',
                        valueWithUnits: 'Male',
                      ),
                      const SizedBox(height: 50),
                      const CallAmbulanceButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
