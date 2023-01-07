part of 'users_list_bloc.dart';

abstract class UsersListState extends Equatable {
  const UsersListState();
  @override
  List<Object> get props => [];
}


class DialogVisible extends UsersListState {}
class DialogInvisible extends UsersListState {}
