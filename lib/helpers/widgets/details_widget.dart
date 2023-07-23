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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ValueListenableBuilder<int>(
              valueListenable: maxLinesNotifier,
              builder: (context, value, child) {
                return Text(
                  ambulance.details,
                  style: const TextStyle(fontWeight: FontWeight.w200),
                  maxLines: value,
                  overflow: TextOverflow.ellipsis,
                );
              }),
        ),
        GestureDetector(
          onTap: () {
            if (maxLinesNotifier.value <= 2) {
              maxLinesNotifier.value = 10;
            } else {
              maxLinesNotifier.value = 2;
            }
          },
          child: ValueListenableBuilder(
            valueListenable: maxLinesNotifier,
            builder: ((context, value, child) {
              return Text(
                value <= 2 ? 'Read More' : 'Show Less',
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
