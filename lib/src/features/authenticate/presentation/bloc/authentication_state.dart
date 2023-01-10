import 'package:equatable/equatable.dart';

import '../../../users_list/domain/user_entity.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial({this.hasError = false});

  final bool hasError;
}

class AuthenticationRegister extends AuthenticationState {}

class AuthenticationSucceed extends AuthenticationState {
  final UserEntity user;

  const AuthenticationSucceed({required this.user});

  @override
  List<Object> get props => [user];
}
