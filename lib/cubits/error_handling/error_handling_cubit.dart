// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ambulance/constants.dart';
import 'package:ambulance/cubits/ambulance_list/ambulance_list_cubit.dart';
import 'package:ambulance/cubits/district_list/district_list_cubit.dart';
import 'package:ambulance/cubits/intenet_services/internet_services_cubit.dart';
import 'package:ambulance/cubits/user/user_cubit.dart';
import 'package:ambulance/exceptions/custom_exception.dart';

part 'error_handling_state.dart';

class ErrorHandlingCubit extends Cubit<ErrorHandlingState> {
  final InternetServicesCubit internetServicesCubit;
  final UserCubit userCubit;
  final DistrictListCubit districtListCubit;
  final AmbulanceListCubit ambulanceListCubit;

  late final StreamSubscription internetServicesStreamSubscription;
  late final StreamSubscription userStreamSubscription;
  late final StreamSubscription districtListStreamSubscription;
  late final StreamSubscription ambulanceListStreamSubscription;

  ErrorHandlingCubit({
    required this.internetServicesCubit,
    required this.userCubit,
    required this.districtListCubit,
    required this.ambulanceListCubit,
  }) : super(ErrorHandlingState.initial()) {
    //internetServicesStreamSubscription
    internetServicesStreamSubscription =
        internetServicesCubit.stream.listen((_) {
      _errorStateGenerator();
    });
    //internetServicesStreamSubscription
    userStreamSubscription = userCubit.stream.listen((_) {
      _errorStateGenerator();
    });
    //internetServicesStreamSubscription
    districtListStreamSubscription = districtListCubit.stream.listen((_) {
      _errorStateGenerator();
    });
    //internetServicesStreamSubscription
    ambulanceListStreamSubscription = ambulanceListCubit.stream.listen((_) {
      _errorStateGenerator();
    });
  }

  @override
  Future<void> close() {
    internetServicesStreamSubscription.cancel();
    userStreamSubscription.cancel();
    districtListStreamSubscription.cancel();
    ambulanceListStreamSubscription.cancel();
    return super.close();
  }


  void _errorStateGenerator() {
    final userCubitErrorCode = userCubit.state.exception.errorCode;
    final districtListErrorCode = districtListCubit.state.exception.errorCode;
    final ambulanceListErrorCode = ambulanceListCubit.state.exception.errorCode;

    if (internetServicesCubit.state.internetStatus ==
        InternetStatus.disconnected) {
      //If app failed to get user's pickup location
      if ((userCubitErrorCode >= 100 && userCubitErrorCode <= 202) ||
          (userCubit.state.user.geoCoordinates == null &&
              !districtListCubit.state.hasFetchedList &&
              !ambulanceListCubit.state.hasFetchedList)) {
        //First, emit no error, then emit error so that it is considered a state change even when it is persistent
        emit(state.copyWith(exception: emptyException));
        emit(
          state.copyWith(
            exception: CustomException(
              errorCode: 500,
              title: errorCodesMap[500][title],
              message: 'Failed to get User pickup location!',
              errorOrigin: ErrorOrigins.userRepository,
            ),
          ),
        );
      }
      //If app failed to get district distance and duration
      else if ((districtListErrorCode >= 100 && districtListErrorCode <= 105) ||
          (districtListCubit.state.districtList.isNotEmpty &&
              districtListCubit.state.districtList[0].duration.value == 0 &&
              districtListCubit.state.districtList[1].duration.value == 0 &&
              userCubit.state.dataStatus == DataStatus.loaded)) {
        //First, emit no error, then emit error so that it is considered a state change even when it is persistent
        emit(state.copyWith(exception: emptyException));
        emit(
          state.copyWith(
            exception: CustomException(
              errorCode: 501,
              title: errorCodesMap[501][title],
              message: 'Failed to get District List\'s distance and duration !',
              errorOrigin: ErrorOrigins.districtListRepository,
            ),
          ),
        );
      }
      //If app failed to get ambulance list from firebase
      else if (!ambulanceListCubit.state.hasFetchedList &&
          districtListCubit.state.hasFetchedList &&
          (ambulanceListCubit.state.exception.errorCode == 302 ||
              ambulanceListCubit.state.exception.errorCode == 303)) {
        //First, emit no error, then emit error so that it is considered a state change even when it is persistent
        emit(state.copyWith(exception: emptyException));
        emit(
          state.copyWith(
            exception: CustomException(
              errorCode: 502,
              title: errorCodesMap[502][title],
              message: 'Failed to get Ambulance List from database !',
              errorOrigin: ErrorOrigins.ambulanceListRepository,
            ),
          ),
        );
      }
      //If app failed to get ambulance list distance and duration
      else if ((ambulanceListErrorCode >= 100 &&
              ambulanceListErrorCode <= 105) ||
          (ambulanceListCubit.state.ambulanceList.isNotEmpty &&
              ambulanceListCubit.state.ambulanceList[0].duration.value == 0 &&
              ambulanceListCubit.state.ambulanceList[1].duration.value == 0 &&
              districtListCubit.state.dataStatus == DataStatus.loaded)) {
        //First, emit no error, then emit error so that it is considered a state change even when it is persistent
        emit(state.copyWith(exception: emptyException));
        emit(
          state.copyWith(
            exception: CustomException(
              errorCode: 503,
              title: errorCodesMap[503][title],
              message: 'Failed to get Ambulance List distance and duration !',
              errorOrigin: ErrorOrigins.ambulanceListRepository,
            ),
          ),
        );
      } else {
        //If internet is just off but did not affect anything
        //First, emit no error, then emit error so that it is considered a state change even when it is persistent
        emit(state.copyWith(exception: emptyException));
        emit(
          state.copyWith(
          exception: CustomException(
        errorCode: 98,
              title: errorCodesMap[98][title],
        message: 'No internet services!',
        errorOrigin: ErrorOrigins.internetServicesRepository,
            ),
          ),
        );
      }
    } else if (userCubitErrorCode > 0) {
      //First, emit no error, then emit error so that it is considered a state change even when it is persistent
      emit(state.copyWith(exception: emptyException));
      emit(state.copyWith(exception: userCubit.state.exception));
    } else if (districtListErrorCode > 0) {
      //First, emit no error, then emit error so that it is considered a state change even when it is persistent
      emit(state.copyWith(exception: emptyException));
      emit(state.copyWith(exception: districtListCubit.state.exception));
    } else if (ambulanceListErrorCode > 0) {
      //First, emit no error, then emit error so that it is considered a state change even when it is persistent
      emit(state.copyWith(exception: emptyException));
      emit(state.copyWith(exception: ambulanceListCubit.state.exception));
    }
  }
}
