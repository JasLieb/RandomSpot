part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class StartLoginEvent extends LoginEvent {}

class ConnectedEvent extends LoginEvent {}