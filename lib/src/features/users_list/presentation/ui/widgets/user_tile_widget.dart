import 'dart:convert';
import 'dart:developer';

import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/user_entity.dart';

class UserTileWidget extends StatefulWidget {
  UserTileWidget({Key? key, required this.userEntity}) : super(key: key);

  final UserEntity userEntity;
  String userImagePath = 'assets/images/users/user.png';
  bool loaded = false;

  @override
  State<UserTileWidget> createState() => _UserTileWidgetState();
}

class _UserTileWidgetState extends State<UserTileWidget> {
  @override
  Widget build(BuildContext context) {
    var possibleImagePath = 'assets/images/users/${widget.userEntity.name}.png';
    if (!widget.loaded) {
      isLocalAsset(possibleImagePath).then((value) {
        if (value) widget.userImagePath = possibleImagePath;
        log('isLocalAsset: $value');
        setState(() {
          widget.loaded = true;
        });
      });
    }
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
                      .add(RemoveUserEvent(userEntity: widget.userEntity));
                  Navigator.pop(childContext);
                },
              );
            },
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.userImagePath),
            radius: 30,
          ),
          title: Text(widget.userEntity.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          subtitle: Text(widget.userEntity.role.toSentenceCaseString(),
              style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  Future<bool> isLocalAsset(final String assetPath) async {
    final encoded =
        utf8.encoder.convert(Uri(path: Uri.encodeFull(assetPath)).path);
    final asset = await ServicesBinding.instance.defaultBinaryMessenger
        .send('flutter/assets', encoded.buffer.asByteData());
    return asset != null;
  }
}
