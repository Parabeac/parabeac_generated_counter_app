import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({
    int initialState = 0,
  }) : super(initialState);

  void increment() => emit(state + 1);
}
