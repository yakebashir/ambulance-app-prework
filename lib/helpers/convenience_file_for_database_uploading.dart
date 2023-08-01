//Convenienve function for uploading our databases
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/ambulance_list/ambulance_list_cubit.dart';
import '../cubits/district_list/district_list_cubit.dart';

Future<void> createDatabases(BuildContext context) async {
  //This is just a convenience function
  //Create district list database
  await context.read<DistrictListCubit>().createOrUpdateList();
  if (context.mounted) {
    //Create ambulance list database
    await context.read<AmbulanceListCubit>().createOrUpdateList();
  }
}
