import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_practices/Cubit_with_State(CounterApp)/counterState.dart";

class CounterCubitClass extends Cubit<CounterState> {
  CounterCubitClass() : super(CounterState(countvalue: 0));

  increment() {
    emit(
      CounterState(countvalue: state.countvalue + 1),
    );
  }

  decrement() {
    emit(
      CounterState(countvalue: state.countvalue - 1),
    );
  }
}
