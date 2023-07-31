import '../models/ambulance_model.dart';
import '../models/travel_distance_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/driver_model.dart';
import '../../models/geocoordinates_model.dart';
import '../../models/hospital_model.dart';
import '../../models/travel_duration_model.dart';
import 'singel_ambulance_display_widget.dart';

class HomePageSkeletonList extends StatelessWidget {
  const HomePageSkeletonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Your list view is usually one expanded widget away from working
    return Expanded(
      child: ListView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: const SingleAmbulanceDisplayWidget(ambulance: ambulance),
          );
        },
      ),
    );
  }
}

const ambulance = Ambulance(
  distance: TravelDistance(text: '0 km', value: 0),
  duration: TravelDuration(text: '0 km', value: 0),
  details:
      'St. Joseph\'s Hospital Wakiso is a leading medical facility in the Wakiso district, Uganda. Renowned for its compassionate care and advanced medical services, the hospital offers a wide range of healthcare solutions to the local community. With a team of dedicated professionals, it strives to improve health outcomes and promote well-being.',
  hospital: Hospital(
    name: 'St. Joseph\'s Hospital Wakiso',
    district: 'Wakiso',
    geoCoordinates: GeoCoordinates(
      latitude: 0.5539196999999999,
      longitude: 32.63671790000001,
    ),
  ),
  driver: Driver(
    name: 'John',
    gender: 'Male',
    airtelNumber: '0759 039795',
    mtnNumber: '',
  ),
);
