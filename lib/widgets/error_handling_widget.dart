import 'package:ambulance/constants.dart';

import '../cubits/error_handling/error_handling_cubit.dart';
import '../cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/ambulance_list/ambulance_list_cubit.dart';
import '../cubits/district_list/district_list_cubit.dart';
import '../cubits/intenet_services/internet_services_cubit.dart';
import '../helpers/auto_adjusting_delay.dart';

typedef AsyncVoidCallback = Future<void> Function(BuildContext context);

class ErrorHandlingWidget extends StatelessWidget {
  final BuildContext context;
  final Widget child;

  const ErrorHandlingWidget({
    required this.context,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
      listener: (context, state) {
        AsyncVoidCallback? function;
        final exception = state.exception;
        if (exception.errorCode == 500) {
          function = fixError500;
        } else if (exception.errorCode == 501) {
          function = fixError501;
        } else if (exception.errorCode == 502) {
          function = fixError502;
        } else if (exception.errorCode == 503) {
          function = fixError503;
        } else if (exception.errorCode == 98) {
          function = fixError98;
        }

        //Showing a snackbar for all the internet errors with the same message but different actions for each error
        if (function != null) {
          showSnackBar(
            context: context,
            function: function,
          );
        }
        //For the case of error 202, we show a special dialog box with 2 buttons
        else if (exception.errorCode == 202) {
          showDialogBox(
            context: context,
            title: exception.title,
            message: exception.message,
            function: fixError202,
            actionButtonText: 'OK',
          );
          
        }
        //If there is no error, we show nothing
        else if (exception.errorCode == 0) {
          //This is not an error. So, do nothing.
        }
        //For all the other errors, we for now just show the error and an ok button that closes the error dialog
        //this is to help us see more errors and decide how to deal with them
        else {
          showDialogBox(
            context: context,
            title: exception.title,
            message: exception.message,
            function: null,
            secondButtonVisible: false,
            actionButtonText: 'OK',
          );
        }
      },
      child: child,
    );
  }
}

void showSnackBar({
  required BuildContext context,
  required AsyncVoidCallback? function,
}) {
  final snackBar = SnackBar(
    content: const Text('Not connected to the internet'),
    duration: const Duration(
      days: 1, // Set to 1 day
    ),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: () async {
        if (function != null) {
          await function(context);
        }
      },
    ),
  );

  // Show the SnackBar using the ScaffoldMessenger
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showDialogBox({
  required BuildContext context,
  required String title,
  required String message,
  required AsyncVoidCallback? function,
  String actionButtonText = 'Retry',
  bool secondButtonVisible = true,
  String secondButtonText = 'Cancel',
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: kBlack),
        ),
        content: Text(
          message,
          style: TextStyle(color: kDarkGrey),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(actionButtonText),
            onPressed: () async {
              if (function != null) {
                await function(context);
              }
              if (context.mounted) {
                Navigator.pop(context); // Close the dialog box
              }
            },
          ),
          Visibility(
            visible: secondButtonVisible,
            child: TextButton(
              child: Text(secondButtonText),
              onPressed: () {
                Navigator.pop(context); // Close the dialog box
              },
            ),
          ),
        ],
      );
    },
  );
}

Future<void> fixError500(BuildContext context) async {
  await context.read<UserCubit>().getLocationPermission();
  // If context is mounted
  if (context.mounted) {
    // Check for internet connectivity
    await context.read<InternetServicesCubit>().checkInternetStatus();

    // If internet is connected, get current user position
    if (context.mounted &&
        context.read<InternetServicesCubit>().state.internetStatus ==
            InternetStatus.connected) {
      // if (mounted &&
      //         !context.read<DistrictListCubit>().state.hasFetchedList ||
      //     !context.read<AmbulanceListCubit>().state.hasFetchedList) {
      //   // Wait 5 seconds
      //   await Future.delayed(const Duration(seconds: 5));
      // }
      await autoAdjustingDelay(context: context);
      if (context.mounted) {
        await context.read<UserCubit>().getCurrentPosition();
      }
    }
  }
}

Future<void> fixError501(BuildContext context) async {
  await context.read<InternetServicesCubit>().checkInternetStatus();
  if (context.mounted &&
      context.read<InternetServicesCubit>().state.internetStatus ==
          InternetStatus.connected) {
    await context.read<DistrictListCubit>().getDistanceAndDuration();
  }
}

Future<void> fixError502(BuildContext context) async {
  await context.read<InternetServicesCubit>().checkInternetStatus();
  if (context.mounted &&
      context.read<InternetServicesCubit>().state.internetStatus ==
          InternetStatus.connected) {
    await context.read<AmbulanceListCubit>().fetchList();
  }
}

Future<void> fixError503(BuildContext context) async {
  await context.read<InternetServicesCubit>().checkInternetStatus();
  if (context.mounted &&
      context.read<InternetServicesCubit>().state.internetStatus ==
          InternetStatus.connected) {
    await context.read<AmbulanceListCubit>().getDistanceAndDuration();
  }
}

Future<void> fixError98(BuildContext context) async {
  await context.read<InternetServicesCubit>().checkInternetStatus();
}

Future<void> fixError202(BuildContext context) async {
  await context.read<UserCubit>().openLocationSettings();
}
