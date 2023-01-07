import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/services/api/users_list_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../domain/user_entity.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc({
    required this.usersListService,
  }) : super(DialogInvisible()) {
    BuildContext? dialogContext = null;
    on<RemoveUserButtonPressed>((_, emit) {
      usersListService.deleteFamilyMember(usersListService.getCurrentUser());
      Navigator.of(dialogContext!, rootNavigator: true).pop();
      emit(DialogInvisible());
    });

    on<CancelButtonPressed>((_, emit) {
      debugPrint("herer");
      Navigator.of(dialogContext!, rootNavigator: true).pop();
      emit(DialogInvisible());

    });

    on<OpenDialog>((x, emit) {

      usersListService.setCurrentUser(x.user);
      dialogContext = x.dialogContext;

      emit(DialogVisible());

    });
  }

  final UsersListService usersListService;
}
