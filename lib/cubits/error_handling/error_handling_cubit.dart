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
    if (internetServicesCubit.state.internetStatus ==
        InternetStatus.disconnected) {
      emit(state.copyWith(
          exception: CustomException(
        errorCode: 98,
        title: errorCodesMap[title],
        message: 'No internet services!',
        errorOrigin: ErrorOrigins.internetServicesRepository,
      )));
    } else if (userCubit.state.exception.errorCode > 0) {
      emit(state.copyWith(exception: userCubit.state.exception));
    } else if (districtListCubit.state.exception.errorCode > 0) {
      emit(state.copyWith(exception: districtListCubit.state.exception));
    } else if (ambulanceListCubit.state.exception.errorCode > 0) {
      emit(state.copyWith(exception: ambulanceListCubit.state.exception));
    }
  }
}
