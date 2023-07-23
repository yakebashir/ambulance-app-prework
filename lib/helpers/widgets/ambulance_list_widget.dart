import 'package:flutter/material.dart';

import '../../models/ambulance_model.dart';
import '../../pages/ambulance_details_page.dart';
import 'ambulance_card_widget.dart';

class AmbulanceListWidget extends StatelessWidget {
  const AmbulanceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: ambulanceList.length,
        itemBuilder: (context, index) {
          final ambulance = ambulanceList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AmbulanceDetailsPage(
                      ambulance: ambulance,
                    );
                  },
                ),
              );
            },
            child: AmbulanceCard(ambulance: ambulance),
          );
        },
      ),
    );
  }
}
