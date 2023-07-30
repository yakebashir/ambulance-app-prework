import 'dart:async';

import '../cubits/ambulance_list/ambulance_list_cubit.dart';
import '../cubits/intenet_services/internet_services_cubit.dart';
import '../cubits/user/user_cubit.dart';
import '../helpers/auto_adjusting_delay.dart';
import '../widgets/error_handling_widget.dart';
import '../widgets/home_page_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../widgets/ambulance_list_widget.dart';
import '../widgets/skeleton_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> _onAppStart() async {
    await context.read<UserCubit>().getLocationPermission();
    //If context is mounted
    if (mounted) {
      print(
        '~~~~~~~~~~~~~~~~Checking for internet connectivity inside home page~~~~~~~~~~~~~~~~',
      );
      //Check for internet connectivity
      await context.read<InternetServicesCubit>().checkInternetStatus();
      //If internet is connected, get current user position
      if (mounted &&
          context.read<InternetServicesCubit>().state.internetStatus ==
              InternetStatus.connected) {
        // if (mounted &&
        //         !context.read<DistrictListCubit>().state.hasFetchedList ||
        //     !context.read<AmbulanceListCubit>().state.hasFetchedList) {
        //   // Wait 5 seconds
        //   await Future.delayed(const Duration(seconds: 5));
        // }
        await autoAdjustingDelay(context: context);
        if (mounted) {
          await context.read<UserCubit>().getCurrentPosition();
        }
      }
    }
  }

  @override
  void didChangeDependencies() async {
    await _onAppStart();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kVeryLightGrey,
        body: BlocBuilder<AmbulanceListCubit, AmbulanceListState>(
            builder: (context, state) {
          if (state.dataStatus != DataStatus.loaded) {
            return ErrorHandlingWidget(
              context: context,
              child: const HomePageBodyWidget(
                listToDisplay: SkeletonListWidget(),
              ),
            );
          }
          return ErrorHandlingWidget(
            context: context,
            child: const HomePageBodyWidget(
              listToDisplay: AmbulanceListWidget(),
            ),
          );
        }),
      ),
    );
  }
}

//Convenienve function for uploading our databases
// Future<void> _createDatabases() async {
//   //This is just a convenience function
//   //Create district list database
//   await context.read<DistrictListCubit>().createOrUpdateList();
//   if (mounted) {
//     //Create ambulance list database
//     await context.read<AmbulanceListCubit>().createOrUpdateList();
//   }
// }
