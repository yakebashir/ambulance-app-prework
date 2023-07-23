import 'package:flutter/material.dart';
import '../../constants.dart';

class EstimatesWidget extends StatelessWidget {
  //variable that holds the name of the desired estimate
  final String estimate;
  //variable that holds the value of the desired estimate
  final String valueWithUnits;

  const EstimatesWidget({
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
          flex: 3,
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
            valueWithUnits,
            style: const TextStyle(
              fontSize: 16,
              color: kViolet,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
