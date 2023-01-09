import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/services/api/authentication_service.dart';
import 'package:dome_smart_home_app/src/features/users_list/domain/user_entity.dart';
import 'package:dome_smart_home_app/src/features/users_list/services/api/users_list_service.dart';
import 'package:equatable/equatable.dart';

part 'users_list_event.dart';

part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc(
      {required this.usersListService, required this.authenticationService})
      : super(UsersListInitial()) {
    on<LoadUsersListEvent>(_onLoadUsersList);
    on<RemoveUserEvent>(_onRemoveUser);
    on<AddUserEvent>(_onAddUser);
  }

  final UsersListService usersListService;
  final AuthenticationService authenticationService;

  _onLoadUsersList(LoadUsersListEvent event, Emitter<UsersListState> emit) {
    emit(
      UsersListLoaded(
        usersListCount: usersListService.familyMembers.length,
        usersList: usersListService.familyMembers,
      ),
    );
  }

  _onRemoveUser(RemoveUserEvent event, Emitter<UsersListState> emit) {
    usersListService.deleteFamilyMember(event.userEntity);
    emit(
      UsersListLoaded(
        usersListCount: usersListService.familyMembers.length,
        usersList: usersListService.familyMembers,
      ),
    );
  }

  _onAddUser(AddUserEvent event, Emitter<UsersListState> emit) {
    List<UserEntity> allUsers = authenticationService.allUsers;
    for (var user in allUsers) {
      if (user.email == event.email) {
        user.role = event.role;
        usersListService.familyMembers.add(user);
      }
    }
    emit(
      UsersListLoaded(
        usersListCount: usersListService.familyMembers.length,
        usersList: usersListService.familyMembers,
      ),
    );
  }
}
