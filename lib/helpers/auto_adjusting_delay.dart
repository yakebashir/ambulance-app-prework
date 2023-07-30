import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/ambulance_list/ambulance_list_cubit.dart';
import '../cubits/district_list/district_list_cubit.dart';

typedef BoolCallback = bool Function({required BuildContext context});
Future<void> autoAdjustingDelay({
  required BuildContext context,
}) async {
  while (true) {
    if (isDataFetchComplete(context)) {
      return;
    } else {
      await Future.delayed(const Duration(milliseconds: 100));
      print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    }
  }
}

bool isDataFetchComplete(BuildContext context) {
  if (context.read<DistrictListCubit>().state.hasFetchedList &&
      context.read<AmbulanceListCubit>().state.hasFetchedList) {
    return true;
  } else {
    return false;
  }
}
