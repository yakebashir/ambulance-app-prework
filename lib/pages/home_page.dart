import 'dart:async';

import 'package:ambulance/cubits/ambulance_list/ambulance_list_cubit.dart';
import 'package:ambulance/cubits/district_list/district_list_cubit.dart';
import 'package:ambulance/cubits/intenet_services/internet_services_cubit.dart';
import 'package:ambulance/cubits/user/user_cubit.dart';
import 'package:ambulance/widgets/error_handling_widget.dart';
import 'package:ambulance/widgets/home_page_body_widget.dart';
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
  // Future<void> _createDatabases() async {
  //   //This is just a convenience function
  //   //Create district list database
  //   await context.read<DistrictListCubit>().createOrUpdateList();
  //   if (mounted) {
  //     //Create ambulance list database
  //     await context.read<AmbulanceListCubit>().createOrUpdateList();
  //   }
  // }
  void _emptyFunction() {}
  void rebuildPage() {
    setState(() {
      _emptyFunction();
    });
  }

  Future<void> _onAppStart() async {
    await context.read<UserCubit>().getLocationPermission();
    //If context is mounted
    if (mounted) {
      print(
          '\n ............................Checking Internet Status...............................');
      //Check for internet connectivity
      await context.read<InternetServicesCubit>().checkInternetStatus();

      //If internet is connected, get current user position
      if (mounted &&
          context.read<InternetServicesCubit>().state.internetStatus ==
              InternetStatus.connected) {
        //await _createDatabases();
        print(
            '\n ............................Checking If lists have been fetched...............................');
        print(context.read<InternetServicesCubit>().state.toMap());
        print(
            'Is District list fetched? : ${context.read<DistrictListCubit>().state.hasFetchedList}');
        print(
            'Is Ambulance list fetched? : ${context.read<AmbulanceListCubit>().state.hasFetchedList}');

        if (mounted &&
                !context.read<DistrictListCubit>().state.hasFetchedList ||
            !context.read<AmbulanceListCubit>().state.hasFetchedList) {
          // Wait 10 seconds
          await Future.delayed(const Duration(seconds: 10));
        }
        print(context.read<InternetServicesCubit>().state.toMap());
        print(
            'Is District list fetched? :${context.read<DistrictListCubit>().state.hasFetchedList}');
        print(
            'Is Ambulance list fetched? :${context.read<AmbulanceListCubit>().state.hasFetchedList}');
        print(
            '\n ............................Done...............................');

        await context.read<UserCubit>().getCurrentPosition();
        print(
            '\n ............................Current position gotten...............................');
      }
    }
  }

  @override
  void didChangeDependencies() async {
    _emptyFunction();
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
              function: () {
                rebuildPage();
              },
            );
          }
          return ErrorHandlingWidget(
            context: context,
            child: const HomePageBodyWidget(
              listToDisplay: AmbulanceListWidget(),
            ),
            function: () {
              rebuildPage();
            },
          );
        }),
      ),
    );
  }
}
