import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class RegisterButtonPressed extends AuthenticationEvent {}
class AuthenticateUser extends AuthenticationEvent {
  const AuthenticateUser({required this.name, required this.email, required this.password});

  final String name;
  final String email;
  final String password;
}
class LoginUser extends AuthenticationEvent {
  const LoginUser({required this.failure});

  final bool failure;
}
class GoToLoginPage extends AuthenticationEvent {}