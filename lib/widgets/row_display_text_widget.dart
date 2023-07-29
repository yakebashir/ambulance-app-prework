import 'package:flutter/material.dart';

import '../../constants.dart';

class RowDisplayTextWidget extends StatelessWidget {
  //variable that holds the name of the desired estimate
  final String estimate;
  //variable that holds the value of the desired estimate
  final String valueWithUnits;

  const RowDisplayTextWidget({
    required this.estimate,
    required this.valueWithUnits,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          //flex: 2,
          child: Text(
            estimate,
            style: TextStyle(
              fontSize: 16,
              color: kDarkGrey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            ':',
            style: TextStyle(
              fontSize: 16,
              color: kDarkGrey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            '$valueWithUnits.',
            style: const TextStyle(
              fontSize: 16,
              color: kEngineeringOrange,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
