import 'package:ambulance/cubits/error_handling/error_handling_cubit.dart';
import 'package:ambulance/cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/intenet_services/internet_services_cubit.dart';

typedef VoidCallback = void Function();

class ErrorHandlingWidget extends StatelessWidget {
  final BuildContext context;
  final Widget child;
  final VoidCallback? function;

  const ErrorHandlingWidget({
    required this.context,
    required this.child,
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
      listener: (context, state) {
        final exception = state.exception;
        if (exception.errorCode == 98) {
          showSnackBar(context, function);
        } else if (exception.errorCode == 202) {
          showDialogBox(
            context: context,
            title: exception.title,
            message: exception.message,
            function: context.read<UserCubit>().openLocationSettings(),
            actionButtonText: 'OK',
            secondButtonVisible: false,
          );
        } else {
          showDialogBox(
            context: context,
            title: exception.title,
            message: exception.message,
            function:
                context.read<InternetServicesCubit>().checkInternetStatus(),
          );
        }
      },
      child: child,
    );
  }
}

void showSnackBar(BuildContext context, VoidCallback? function) {
  final snackBar = SnackBar(
    content: const Text('Please connect to the internet'),
    duration: const Duration(
      days: 1, // Set to 1 day
    ),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: () async {
        await context.read<InternetServicesCubit>().checkInternetStatus();
        function;
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
  required Future<void> function,
  String actionButtonText = 'Retry',
  bool secondButtonVisible = true,
  String secondButtonText = 'Cancel',
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(actionButtonText),
            onPressed: () async {
              Navigator.pop(context); // Close the dialog box
              await function;
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
