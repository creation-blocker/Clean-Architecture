part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  LoginEvent(this.username, this.password);
}

class RegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  RegisterEvent(this.username, this.password, this.firstName, this.lastName);
}