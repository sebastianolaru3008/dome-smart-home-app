part of 'users_list_bloc.dart';

@immutable
abstract class UsersListEvent extends Equatable{
  const UsersListEvent();
  @override
  List<Object?> get props => [];
}

class RemoveUserButtonPressed extends UsersListEvent {
}

class CancelButtonPressed extends UsersListEvent {
}

class OpenDialog extends UsersListEvent {
  final UserEntity user;
  final BuildContext dialogContext;
  OpenDialog(this.user, this.dialogContext);
}