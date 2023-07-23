import 'package:flutter/material.dart';

import '../constants.dart';
import '../helpers/widgets/ambulance_card_widget.dart';
import '../helpers/widgets/ambulance_estimates_widget.dart';
import '../helpers/widgets/call_ambulance_button.dart';
import '../helpers/widgets/details_widget.dart';
import '../helpers/widgets/driver_info_display_widget.dart';
import '../helpers/widgets/section_heading_widget.dart';
import '../helpers/widgets/spaced_divider_widget.dart';
import '../models/ambulance_model.dart';

class AmbulanceDetailsPage extends StatelessWidget {
  //ambulance object
  final Ambulance ambulance;

  AmbulanceDetailsPage({
    required this.ambulance,
    super.key,
  });
  static const String routeName = '/ambulanceDetailsPage';

  final ValueNotifier<int> maxLinesNotifier = ValueNotifier(2);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kVeryLightGrey,
        appBar: AppBar(
          backgroundColor: kViolet,
          leading: IconButton(
            color: kWhite,
            highlightColor: kElectricViolet,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
                vertical: kVerticalPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AmbulanceCard(ambulance: ambulance),
                  const SpacedDivider(),
                  const SectionHeading(text: 'About'),
                  const SizedBox(height: 20),
                  DetailsWidget(
                    maxLinesNotifier: maxLinesNotifier,
                    ambulance: ambulance,
                  ),
                  const SizedBox(height: 30),
                  const EstimatesWidget(
                    estimate: 'Estimated Distance',
                    valueWithUnits: '12 km',
                  ),
                  const SizedBox(height: 30),
                  const EstimatesWidget(
                    estimate: 'Estimated arrival time',
                    valueWithUnits: '35 minutes',
                  ),
                  const SpacedDivider(),
                  const SectionHeading(text: 'Driver Information'),
                  const SizedBox(height: 20),
                  const DriverInfoDisplayWidget(
                    heading: 'Name',
                    value: 'Richard Lee',
                  ),
                  const SizedBox(height: 30),
                  const DriverInfoDisplayWidget(
                    heading: 'Gender',
                    value: 'Male',
                  ),
                  const SizedBox(height: 150),
                  const CallAmbulanceButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
