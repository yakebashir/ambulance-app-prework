import 'package:flutter/material.dart';

import '../../constants.dart';

class DriverInfoDisplayWidget extends StatelessWidget {
  //variable that holds the title of the driver's information
  final String heading;
  //variable that holds the actual driver's information
  final String value;

  const DriverInfoDisplayWidget({
    required this.heading,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$heading : ',
          style: TextStyle(
            fontSize: 16,
            color: kDarkGrey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: kViolet,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
