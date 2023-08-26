import 'dart:async';

import '../cubits/ambulance_list/ambulance_list_cubit.dart';
import 'package:flutter/services.dart';
import '../cubits/intenet_services/internet_services_cubit.dart';
import '../cubits/user/user_cubit.dart';
import '../helpers/auto_adjusting_delay.dart';
import '../widgets/error_handling_widget.dart';
import '../widgets/home_page_scaffold_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../constants.dart';
import '../widgets/ambulance_list_display_widget.dart';
import '../widgets/home_page_skeleton_list.dart';

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
      //Check for internet connectivity
      await context.read<InternetServicesCubit>().checkInternetStatus();
      //If internet is connected, get current user position
      if (mounted &&
          context.read<InternetServicesCubit>().state.internetStatus ==
              InternetStatus.connected) {
        await autoAdjustingDelay(context: context);
        if (mounted) {
          await context.read<UserCubit>().getCurrentPosition();
        }
      }
    }
  }

  @override
  //didChangeDependencies is called each time dependencies change ie state within it is updated.
  void didChangeDependencies() async {
    await _onAppStart();
    super.didChangeDependencies(); 
  }


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainWhite,
        body: BlocBuilder<AmbulanceListCubit, AmbulanceListState>(
            builder: (context, state) {
          //If ambulance list dataStatus shows that data has been loaded, return ambulance list
          if (state.dataStatus != DataStatus.loaded) {
            //ErrorHandlingWidget handles errors on both pages. Also, this is the only page that can have errors.
            return ErrorHandlingWidget(
              context: context,
              child: const HomePageScaffoldBodyWidget(
                listToDisplay: HomePageSkeletonList(),
              ),
            );
          }
          //Otherwise, if dataStatus shows data is loading or initial, return skeleton list
          //ErrorHandlingWidget handles errors on both pages. Also, this is the only page that can have errors.
          return ErrorHandlingWidget(
            context: context,
            child: const HomePageScaffoldBodyWidget(
              listToDisplay: AmbulanceListDisplayWidget(),
            ),
          );
        }),
      ),
    );
  }
}
