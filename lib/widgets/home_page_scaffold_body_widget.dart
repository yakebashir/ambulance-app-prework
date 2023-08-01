import 'home_page_header_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomePageScaffoldBodyWidget extends StatelessWidget {
  final Widget listToDisplay;
  const HomePageScaffoldBodyWidget({
    required this.listToDisplay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        HomePageHeaderWidget(
          context: context,
        ),
        const SizedBox(height: 20),
        const Text(
          'Ambulances near you...',
          style: TextStyle(
            color: kMainBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        listToDisplay,
      ],
    );
  }
}
