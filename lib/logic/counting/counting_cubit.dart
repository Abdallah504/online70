import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counting_state.dart';

class CountingCubit extends Cubit<CountingState> {
  CountingCubit() : super(CountingInitial());

  int result = 0;


  Increment(){
    result++;
    emit(InreasingState());
  }


  Decrement(){
    if(result !=0){
      result--;
      emit(DecreasingState());
    }

  }

  Map<String,dynamic>data={

  };
}
