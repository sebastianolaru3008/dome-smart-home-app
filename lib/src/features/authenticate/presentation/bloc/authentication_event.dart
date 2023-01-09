import 'package:dome_smart_home_app/src/features/users_list/domain/user_entity.dart';
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
class LoginEvent extends AuthenticationEvent {
  const LoginEvent({required this.email, required this.password});

  final String email;
  final String password;
}

class LoginUser extends AuthenticationEvent {
  const LoginUser({required this.failure, required this.user});

  final UserEntity user;
  final bool failure;
}
class GoToLoginPage extends AuthenticationEvent {}