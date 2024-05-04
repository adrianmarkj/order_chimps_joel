part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BaseState<LoginState> {}

class LoginInitial extends LoginState {}

class AuthSuccessState extends LoginState {
  final AuthResponse authResponse;

  AuthSuccessState({required this.authResponse});
}

class AuthFailState extends LoginState {
  final String? error;

  AuthFailState({this.error});
}
