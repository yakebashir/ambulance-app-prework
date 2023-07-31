import 'package:flutter/material.dart';

import '../../constants.dart';

class DriverDetailsDisplayWidget extends StatelessWidget {
  //variable that holds the name of the desired estimate
  final String estimate;
  //variable that holds the value of the desired estimate
  final String valueWithUnits;
  //variable that holds text color
  final Color textColor;

  const DriverDetailsDisplayWidget({
    required this.estimate,
    required this.valueWithUnits,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 10,
        color: kWhite,
        surfaceTintColor: Colors.transparent,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              ':',
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
            Expanded(
              //flex: 2,
              child: Text(
                '$valueWithUnits.',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
