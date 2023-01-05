import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationRegister extends AuthenticationState {}
class AuthenticationSucceed extends AuthenticationState {}
