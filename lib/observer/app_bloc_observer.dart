import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc observer is enabled in main. It prints state changes and errors as they occur.
//It is good for error handling
class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError - ${bloc.runtimeType}: $error : $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange - ${bloc.runtimeType}: $change');
  }
}
