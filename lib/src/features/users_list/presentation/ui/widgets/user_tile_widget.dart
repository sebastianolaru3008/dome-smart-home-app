import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/user_entity.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({Key? key, required this.userEntity}) : super(key: key);

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      shadowColor: Colors.grey,
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onLongPress: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext childContext) {
              return DialogWidget(
                dialogTitle: "Are you sure you want to delete this user?",
                textEmptyButton: "No, cancel",
                textFullButton: "Yes, delete",
                onCancelCallback: () {
                  Navigator.pop(childContext);
                },
                onFullCallback: () {
                  context
                      .read<UsersListBloc>()
                      .add(RemoveUserEvent(userEntity: userEntity));
                  Navigator.pop(childContext);
                },
              );
            },
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage("assets/images/users/${userEntity.name}.png"),
            radius: 30,
          ),
          title: Text(userEntity.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          subtitle: Text(userEntity.role.toSentenceCaseString(), style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
