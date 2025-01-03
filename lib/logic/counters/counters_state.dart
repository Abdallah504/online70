part of 'counters_bloc.dart';

@immutable
sealed class CountersState {}

final class CountersInitial extends CountersState {}
final class CountttttState extends CountersState{
  final int value;
  CountttttState(this.value);
}
