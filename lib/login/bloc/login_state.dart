part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginNotConnected extends LoginState {}

class LoginConnected extends LoginState {
  final String token;

  LoginConnected(this.token);
  
}
