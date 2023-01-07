import 'package:dome_smart_home_app/src/features/example/domain/example_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/user_entity.dart';
import '../../bloc/users_list_bloc.dart';

class ButtonFullWidget extends StatelessWidget {
  const ButtonFullWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )
            )
        ),
        onPressed: () {
          context.read<UsersListBloc>().add(RemoveUserButtonPressed());
        },
        child: Text(text, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
