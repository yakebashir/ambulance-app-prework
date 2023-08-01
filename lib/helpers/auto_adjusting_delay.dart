import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/ambulance_list/ambulance_list_cubit.dart';
import '../cubits/district_list/district_list_cubit.dart';

typedef BoolCallback = bool Function({required BuildContext context});
//This function creates a delay that auto adjusts until the fetching is done
Future<void> autoAdjustingDelay({
  required BuildContext context,
}) async {
  while (true) {
    if (isDataFetchComplete(context)) {
      return;
    } else {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }
}

//Function that checks if district and ambulance lists' fetching is complete.
//User cubit waits for the fetching to be complete before it makes its calls so that the network
//..is not overwhelmed. Not sure if that would even happen.
bool isDataFetchComplete(BuildContext context) {
  if (context.read<DistrictListCubit>().state.hasFetchedList &&
      context.read<AmbulanceListCubit>().state.hasFetchedList) {
    return true;
  } else {
    return false;
  }
}
