import 'package:flutter/material.dart';

import '../../constants.dart';

class DriverDetailsDisplayWidget extends StatelessWidget {
  //variable that holds the name of the desired estimate
  final String estimate;
  //variable that holds the value of the desired estimate
  final String valueWithUnits;
  //variable that holds text color
  final Color textColor;
  final ShapeBorder? shape;

  const DriverDetailsDisplayWidget({
    required this.estimate,
    required this.valueWithUnits,
    required this.textColor,
    this.shape,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        shape: shape,
        elevation: 10,
        color: kMainWhite,
        surfaceTintColor: kMainTintColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  estimate,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const Text(
              ':',
              style: TextStyle(
                fontSize: 16,
                color: kMainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              //flex: 2,
              child: Center(
                child: Text(
                  '$valueWithUnits.',
                  style: const TextStyle(
                    fontSize: 16,
                    color: kMainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
