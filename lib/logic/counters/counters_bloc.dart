import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counters_event.dart';
part 'counters_state.dart';

class CountersBloc extends Bloc<CountersEvent, CountttttState> {
  CountersBloc() : super(CountttttState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(CountttttState(state.value +1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CountttttState(state.value!=0?  state.value -1: state.value));
    });
  }
}
