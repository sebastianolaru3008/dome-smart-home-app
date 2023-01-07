import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/domain/user_entity.dart';
import 'package:dome_smart_home_app/src/features/users_list/services/api/users_list_service.dart';
import 'package:equatable/equatable.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc({
    required this.usersListService,
  }) : super(UsersListInitial()) {
    on<LoadUsersListEvent>(_onLoadUsersList);
    on<RemoveUserEvent>(_onRemoveUser);
  }

  final UsersListService usersListService;

  _onLoadUsersList(LoadUsersListEvent event, Emitter<UsersListState> emit) {
    emit(
      UsersListLoaded(
        usersListCount: usersListService.familyMembers.length,
        usersList: usersListService.familyMembers,
      ),
    );
  }

  _onRemoveUser(RemoveUserEvent event, Emitter<UsersListState> emit) {
    // print(state);
    usersListService.deleteFamilyMember(event.userEntity);
    emit(
      UsersListLoaded(
        usersListCount: usersListService.familyMembers.length,
        usersList: usersListService.familyMembers,
      ),
    );
    // print(state);
  }
}
