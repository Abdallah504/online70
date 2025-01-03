part of 'counters_bloc.dart';

@immutable
sealed class CountersEvent {}

class IncrementEvent extends CountersEvent{}
class DecrementEvent extends CountersEvent{}

