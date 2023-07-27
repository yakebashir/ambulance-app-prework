import 'package:flutter/material.dart';

import '../../models/ambulance_model.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.maxLinesNotifier,
    required this.ambulance,
  });

  //variable that determines how many lines of the ambulance details are displayed
  final ValueNotifier<int> maxLinesNotifier;
  //ambulance object
  final Ambulance ambulance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: maxLinesNotifier,
          builder: (context, value, child) {
            return Text(
              ambulance.details,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.w200),
              maxLines: value,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
        GestureDetector(
          onTap: () {
            if (maxLinesNotifier.value == 2) {
              maxLinesNotifier.value = 10;
            } else {
              maxLinesNotifier.value = 2;
            }
          },
          child: ValueListenableBuilder<int>(
            valueListenable: maxLinesNotifier,
            builder: ((context, value, child) {
              return Text(
                value <= 2 ? 'Read more...' : 'Show less',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              );
            }),
          ),
        ),
        
      ],
    );
  }
}
