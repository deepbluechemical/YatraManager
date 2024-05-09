import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(
        "Bloc ${bloc.state}, Change: ${change.currentState} -> ${change.nextState}");
  }
}
