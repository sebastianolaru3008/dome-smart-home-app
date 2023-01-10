import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/add_tile_widget.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/user_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("My family",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                    fontSize: 20)),
            const SizedBox(height: 10),
            BlocBuilder<UsersListBloc, UsersListState>(
              builder: (context, state) {
                if (state is UsersListLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.usersList.length + 1,
                      itemBuilder: (context, index) {
                        if (index == state.usersList.length) {
                          return const AddTileWidget(title: "Add new user",icon: Icon(Icons.add, size: 32,),isUserTile: true,);
                        }
                        return UserTileWidget(
                            userEntity: state.usersList[index]);
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
