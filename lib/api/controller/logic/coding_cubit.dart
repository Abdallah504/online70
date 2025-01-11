import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coding_state.dart';

class CodingCubit extends Cubit<CodingState> {
  CodingCubit() : super(CodingInitial());
}
