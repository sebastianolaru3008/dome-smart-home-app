import 'package:dome_smart_home_app/src/features/example/domain/example_entity.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/user_entity.dart';
import 'button_empty_widget.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({Key? key, required this.userEntity, required this.state}) : super(key: key);

  final UserEntity userEntity;
  final UsersListState state;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(12.0)
      ),
      shadowColor: Colors.grey,
      elevation: 6,
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/${userEntity.name}.png"),
              radius: 30,
            ),
            title: Text(
                userEntity.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)
            ),
            subtitle: Text(userEntity.role,
                style: const TextStyle(fontSize: 16)
            ),
          onLongPress: (){
              BuildContext dialogContext = context;
            showDialog<String>(
              context: context,
              builder: (BuildContext context) {
              dialogContext = context;
                return const DialogWidget(
                dialogTitle: "Are you sure you want to delete this user?",
                textEmptyButton: "No, cancel",
                textFullButton: "Yes, delete"
            );
          }


            );
            context.read<UsersListBloc>().add((OpenDialog(userEntity, dialogContext)));

          },
          ),
        ),
      ),

    );
  }
}
