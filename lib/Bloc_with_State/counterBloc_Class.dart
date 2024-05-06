import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_practices/Bloc_with_State/counterApp_States.dart";
import "package:flutter_practices/Bloc_with_State/counter_events.dart";

class CounterBlocState extends Bloc<CounterEventsState, CounterStates> {
  CounterBlocState() : super(CounterStates(countvalue: 0)) {
    on<IncrementEventsState>(
      (event, emit) {
        emit(
          CounterStates(countvalue: state.countvalue + 1),
        );
      },
    );

    on<DecrementEventsState>(
      (event, emit) {
        emit(
          CounterStates(countvalue: state.countvalue - 1),
        );
      },
    );
  }
}
