import 'package:dome_smart_home_app/src/common/locator/service_locator.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/screens/users_list_screen.dart';
import 'package:dome_smart_home_app/src/features/users_list/services/api/users_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersListBloc(
        usersListService: locator.get<UsersListService>(),
      ),
      child: UsersListScreen(),
    );
  }
}
