import 'package:flutter/material.dart';

//Widget below is now used only as a SizedBox(height: 30) with the middle box commented

class SpacedDivider extends StatelessWidget {
  const SpacedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        // SizedBox(
        //   height: 1,
        //   child: Container(
        //     color: kEngineeringOrange,
        //   ),
        // ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
