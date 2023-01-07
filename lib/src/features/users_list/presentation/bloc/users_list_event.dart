part of 'users_list_bloc.dart';

abstract class UsersListEvent extends Equatable {
  const UsersListEvent();

  @override
  List<Object?> get props => [];
}

class RemoveUserEvent extends UsersListEvent {
  const RemoveUserEvent({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<Object?> get props => [userEntity];
}

class LoadUsersListEvent extends UsersListEvent {}

class AddUserEvent extends UsersListEvent {
  const AddUserEvent({required this.email, required this.role});

  final String email;
  final String role;

  @override
  List<Object?> get props => [email,role];
}
