import 'package:ambulance/widgets/distance_and_duration_display_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/ambulance_model.dart';
import '../widgets/ambulance_details_page_footer_widget.dart';
import '../widgets/ambulance_details_page_header_widget.dart';
import '../widgets/call_ambulance_button.dart';
import '../widgets/about_ambulance_text_display_widget.dart';
import '../widgets/details_page_section_heading_widget.dart';
import '../widgets/spaced_divider_widget.dart';

class AmbulanceDetailsPage extends StatelessWidget {
  //ambulance object
  final Ambulance ambulance;

  AmbulanceDetailsPage({
    required this.ambulance,
    Key? key, // Added the missing key parameter here
  }) : super(key: key); // Fixed the constructor definition here

  static const String routeName = '/ambulanceDetailsPage';

  final ValueNotifier<int> maxLinesNotifier = ValueNotifier(maxLines);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGreyTint,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhite,
          leading: IconButton(
            color: kRedShade,
            highlightColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          title: const Text(
            'Ambulance Details Page',
            style: TextStyle(
              color: kRedShade,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: SingleChildScrollView(
          primary: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AmbulanceDetailsPageHeaderWidget(ambulance: ambulance),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                    //vertical: kVerticalPadding,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SpacedDivider(),
                      const DetailsPageSectionHeadingWidget(
                        text: 'About',
                        color: kRedShade,
                      ),
                      const SizedBox(height: 20),
                      AboutAmbulanceTextDisplayWidget(
                        maxLinesNotifier: maxLinesNotifier,
                        ambulance: ambulance,
                      ),
                      const SizedBox(height: 30),
                      DistanceAndDurationDisplayWidget(ambulance: ambulance),
                      const SizedBox(height: 10),
                      const SpacedDivider(),

                      const SizedBox(height: 20),
                      AmbulanceDetailsPageFooterWidget(ambulance: ambulance),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CallAmbulanceButton(
                          ambulance: ambulance,
                        ),
                      ),
                      //const SizedBox(height: 50),
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

