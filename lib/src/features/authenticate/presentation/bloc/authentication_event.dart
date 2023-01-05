import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class RegisterButtonPressed extends AuthenticationEvent {}
class RegisterButtonPressedInRegisterPage extends AuthenticationEvent {}
class LoginButtonPressed extends AuthenticationEvent {}
class GoToLoginPage extends AuthenticationEvent {}