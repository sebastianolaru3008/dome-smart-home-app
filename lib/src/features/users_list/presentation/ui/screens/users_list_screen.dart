import 'package:dome_smart_home_app/src/features/example/presentation/bloc/example_bloc.dart';
import 'package:dome_smart_home_app/src/features/example/presentation/ui/widgets/example_widget.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/services/api/users_list_service.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/locator/service_locator.dart';
import '../../../domain/user_entity.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/user_tile_widget.dart';

class UsersListScreen extends StatelessWidget {
  UsersListScreen({Key? key}) : super(key: key);

  final List<UserEntity> _usersList = locator
      .get<UsersListService>()
      .familyMembers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dome'),
        ),
        body: BlocBuilder<UsersListBloc, UsersListState>(
          builder: (context, state)
    {

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("My family",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600, fontSize: 20)),
              const SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _usersList.length,
                  itemBuilder: (context, index) {
                    return UserTileWidget(
                        userEntity: _usersList[index], state: state);
                  }),
              const SizedBox(height: 10),
              DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey.shade500,
                radius: const Radius.circular(12.0),
                strokeWidth: 2,
                dashPattern: [17, 20],
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: ListTile(

                        leading: const Icon(Icons.add, size: 32,),
                        title: Text(
                            "Add new user",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500,
                                fontSize: 20)
                        )
                    ),
                  ),
                ),
              )
            ]
        ),
      );
    }



        )
    );
  }
}
