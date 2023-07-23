import 'package:flutter/material.dart';

import '../../constants.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: kViolet,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kRoundedBorderRadius),
          bottomRight: Radius.circular(kRoundedBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kVerticalPadding,
          horizontal: kHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hi, Bashir',
                  style: TextStyle(color: kWhite),
                ),
                IconButton(
                  color: kWhite,
                  highlightColor: kWhite,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    size: 32,
                  ),
                )
              ],
            ),
            const Text(
              'Let\'s find your top Ambulance',
              style: TextStyle(
                color: kWhite,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Select Location',
                hintStyle: TextStyle(color: kBlack),
                filled: true,
                fillColor: kWhite,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      kRoundedBorderRadius,
                    ),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                ),
                prefixIconColor: kBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
