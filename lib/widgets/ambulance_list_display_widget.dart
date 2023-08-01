import '../cubits/ambulance_list/ambulance_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/ambulance_details_page.dart';
import 'singel_ambulance_display_widget.dart';

class AmbulanceListDisplayWidget extends StatelessWidget {
  const AmbulanceListDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: context
            .read<AmbulanceListCubit>()
            .state
            .ambulanceList
            .length, //ambulanceList.length,
        itemBuilder: (context, index) {
          final ambulance = context
              .watch<AmbulanceListCubit>()
              .state
              .ambulanceList[index]; //ambulanceList[index];
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
            child: SingleAmbulanceDisplayWidget(ambulance: ambulance),
          );
        },
      ),
    );
  }
}
