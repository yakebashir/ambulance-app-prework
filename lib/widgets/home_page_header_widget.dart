import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config.dart';
import '../../constants.dart';
import '../../cubits/user/user_cubit.dart';
import 'map_autocomplete_text_field.dart';

class HomePageHeaderWidget extends StatelessWidget {
  final BuildContext context;
  const HomePageHeaderWidget({
    required this.context,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
        text: context.watch<UserCubit>().state.user.pickUpLocation);
    return Container(
      height: MediaQuery.of(context).size.height * 0.46,
      decoration: const BoxDecoration(
        color: kMainColor,
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
                  'Hello !',
                  style: TextStyle(
                    color: kMainWhite,
                  ),
                ),
                IconButton(
                  color: kMainTintColor,
                  highlightColor: Colors.blue,
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
                color: kMainWhite,
                fontSize: 28,
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            MapAutoCompleteTextField(
              inputDecoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kMainTransparent,
                  ),
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
                prefixIconColor: kMainDarkColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: kMainComplementaryColor,
                      size: 15,
                    )),
                filled: true,
                fillColor: kMainWhite,
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
