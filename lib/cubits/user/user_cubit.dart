import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../models/geocoordinates_model.dart';
import '../../models/user_model.dart';
import '../../repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());

  Future<void> getDetails({
    required placeId,
    required googleMapsAPIKey,
  }) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    try {
      final result = await UserRepository.getDetails(
        placeId: placeId,
        googleMapsAPIKey: googleMapsAPIKey,
      );
      emit(
        state.copyWith(
          user: User(
            geoCoordinates: GeoCoordinates(
              latitude: result["result"]["geometry"]["location"]["lat"],
              longitude: result["result"]["geometry"]["location"]["lng"],
            ),
          ),
          dataStatus: DataStatus.loaded,
        ),
      );
      print(state.toMap());
    } catch (e) {
      emit(
        state.copyWith(
          errorStatus: ErrorStatus.errorOccured,
          dataStatus: DataStatus.initial,
        ),
      );
    }
  }
}

//Method is nolonger used
String getDistrictFromResult(
  dynamic result,
) {
  final addressComponents = result['result']['address_components'];
  for (var i = 0; i < addressComponents.length; i++) {
    final type0 = addressComponents[i]['types'][0];
    if (type0 != [] && type0 == 'administrative_area_level_2') {
      return addressComponents[i]['long_name'] ?? 'Unknown';
    }
  }
  return 'Unknown';
}
