import '../cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../models/ambulance_model.dart';

class CallAmbulanceButton extends StatelessWidget {
  final Ambulance ambulance;
  const CallAmbulanceButton({
    required this.ambulance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kEngineeringOrange,
      ),
      onPressed: () {
        String availableNumber;
        final airtel = ambulance.driver.airtelNumber;
        final mtn = ambulance.driver.mtnNumber;
        final userCubit = context.read<UserCubit>();
        //If both numbers are present, give user an option
        if (airtel.trim().isNotEmpty && mtn.trim().isNotEmpty) {
          //Display a widget to allow users choose
        }
        //If both numbers are empty
        else if (airtel.trim().isEmpty && mtn.trim().isEmpty) {
          //Make sure this doesn't happen
        }
        //If only one of the numbers is empty
        else {
          availableNumber = airtel.trim().isNotEmpty ? airtel : mtn;
          userCubit.makePhoneCall(availableNumber);
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Text(
          'Call Ambulance',
          style: TextStyle(
            color: kWhite,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
