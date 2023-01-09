import 'package:equatable/equatable.dart';

import '../../../users_list/domain/user_entity.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationRegister extends AuthenticationState {}
class AuthenticationSucceed extends AuthenticationState {
  final Role role;
  const AuthenticationSucceed({required this.role});

  @override
  List<Object> get props => [role];
}
