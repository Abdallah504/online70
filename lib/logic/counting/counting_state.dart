part of 'counting_cubit.dart';

@immutable
sealed class CountingState {}

final class CountingInitial extends CountingState {}

final class InreasingState extends CountingState{}
final class DecreasingState extends CountingState{}
