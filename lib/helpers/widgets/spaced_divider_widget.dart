import 'package:flutter/material.dart';

import '../../constants.dart';

class SpacedDivider extends StatelessWidget {
  const SpacedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 1,
          child: Container(
            color: kViolet,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
