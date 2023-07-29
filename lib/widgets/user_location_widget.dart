import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config.dart';
import '../../constants.dart';
import '../../cubits/user/user_cubit.dart';
import 'map_autocomplete_field.dart';

class UserLocation extends StatelessWidget {
  final BuildContext context;
  const UserLocation({
    required this.context,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
        text: context.watch<UserCubit>().state.user.pickUpLocation);
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: kEngineeringOrange,
        borderRadius: BorderRadius.only(
          //bottomLeft: Radius.circular(kRoundedBorderRadius),
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
                  'Hi, Beloved',
                  style: TextStyle(color: kWhite),
                ),
                IconButton(
                  color: kWhite,
                  highlightColor: kDarkEngineeringOrange,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.account_circle,
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
            MapAutoCompleteField(
              inputDecoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kRoundedBorderRadius),
                    bottomRight: Radius.circular(kRoundedBorderRadius),
                    // bottomLeft: Radius.circular(kRoundedBorderRadius),
                    // topRight: Radius.circular(kRoundedBorderRadius),
                  ),
                ),
                hintText: 'Enter your pickup location',
                prefixIcon: const Icon(
                  Icons.location_on,
                ),
                prefixIconColor: kEngineeringOrange,
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: kBlack,
                      size: 15,
                    )),
                filled: true,
                fillColor: kWhite,
              ),
              locale: locale,
              googleMapApiKey: gMapsAPIKey,
              controller: controller,
              itemBuilder: (BuildContext context, suggestion) {
                return ListTile(
                  title: Text(suggestion.description),
                );
              },
              onSuggestionSelected: (suggestion) async {
                controller.text = suggestion.description;
                await context.read<UserCubit>().getDetails(
                      suggestion: suggestion,
                      googleMapsAPIKey: gMapsAPIKey,
                    );
              },
            )
          ],
        ),
      ),
    );
  }
}
