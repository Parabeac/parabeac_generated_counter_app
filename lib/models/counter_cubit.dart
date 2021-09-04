import 'package:flutter_bloc/flutter_bloc.dart';

/// This Cubit was not generated and entirely created by developer(s).
/// This Cubit is responsible for providing the state values & business logic for the components needed in my_app_screen.g.dart
class CounterCubit extends Cubit<int> {
  CounterCubit({
    int initialState = 0,
  }) : super(initialState);

  void increment() => emit(state + 1);
}
