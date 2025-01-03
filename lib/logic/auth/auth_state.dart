part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class lgoinSuccess extends AuthState{}
final class lgoinFail extends AuthState{}
final class forgetPassword extends AuthState{}
final class OtpSent extends AuthState{}
final class userData extends AuthState{}
