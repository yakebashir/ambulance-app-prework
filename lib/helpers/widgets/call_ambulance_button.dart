import 'package:flutter/material.dart';

import '../../constants.dart';

class CallAmbulanceButton extends StatelessWidget {
  const CallAmbulanceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kEngineeringOrange,
      ),
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Text(
          'Call Ambulance',
          style: TextStyle(
            color: kWhite,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
