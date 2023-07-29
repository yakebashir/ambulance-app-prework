import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/internet_services_repository.dart';

part 'internet_services_state.dart';

class InternetServicesCubit extends Cubit<InternetServicesState> {
  InternetServicesCubit() : super(InternetServicesState.initial());

  Future<void> checkInternetStatus() async {
    emit(state.copyWith(internetStatus: InternetStatus.initial));
    final bool isInternetConnected =
        await InternetServicesRepository.checkInternetStatus();
    if (isInternetConnected) {
      emit(state.copyWith(internetStatus: InternetStatus.connected));
    } else {
      emit(state.copyWith(internetStatus: InternetStatus.disconnected));
    }
  }
}
