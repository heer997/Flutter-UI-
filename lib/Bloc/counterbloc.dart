import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_practices/Bloc/counterevents.dart";

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>(
      (event, emit) {
        emit(state + 1);
      },
    );

    on<DecrementEvent>(
      (event, emit) {
        emit(state - 1);
      },
    );
  }
}
