part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BaseEvent {}

class Authenticate extends LoginEvent {
  final String username;
  final String password;

  Authenticate({required this.username, required this.password});
}
