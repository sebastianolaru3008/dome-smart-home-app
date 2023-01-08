part of 'users_list_bloc.dart';

abstract class UsersListState extends Equatable {}

class UsersListInitial extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UsersListLoaded extends UsersListState {
  UsersListLoaded({required this.usersListCount, required this.usersList});

  final int usersListCount;
  final List<UserEntity> usersList;

  UsersListLoaded copyWith({
    int? usersListCount,
    List<UserEntity>? usersList,
  }) {
    return UsersListLoaded(
      usersList: usersList ?? this.usersList,
      usersListCount: usersListCount ?? this.usersListCount,
    );
  }

  @override
  List<Object> get props => [usersList, usersListCount];
}
