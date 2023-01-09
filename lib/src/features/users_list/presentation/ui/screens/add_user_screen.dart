import 'package:dome_smart_home_app/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authenticate/presentation/ui/widgets/input_widget.dart';
import '../../../domain/user_entity.dart';

class DropdownDemo extends StatefulWidget {
  const DropdownDemo({Key? key}) : super(key: key);

  @override
  State<DropdownDemo> createState() => AddUserScreen();
}

class AddUserScreen extends State<DropdownDemo> {
  Role dropdownValue = Role.parent;
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/add_user_background.png"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 2,
            ),
            const Text(
              'Add your family member',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              child: Column(
                children: [
                  InputWidget(
                    placeholderText: 'Email address',
                    icon: Icons.mail_outline,
                    getText: (text) {
                      email = text;
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: dropdownValue,
                    items: dropdownItems,
                    dropdownColor: Colors.white,
                    onChanged: (Role? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<DashboardBloc>()
                    .add(const DashboardEventShowBars(areBarsShowing: true));
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Back to Dashboard'),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            ElevatedButton(
              onPressed: () {
                context
                    .read<UsersListBloc>()
                    .add(AddUserEvent(email: email, role: dropdownValue));
                context
                    .read<DashboardBloc>()
                    .add(const DashboardEventShowBars(areBarsShowing: true));
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Add user'),
            ),
          ],
        ),
      ),
    ));
  }
}

List<DropdownMenuItem<Role>> get dropdownItems {
  List<DropdownMenuItem<Role>> roles = [
    DropdownMenuItem(
        value: Role.parent, child: Text(Role.parent.toSentenceCaseString())),
    DropdownMenuItem(
        value: Role.grandparent,
        child: Text(Role.grandparent.toSentenceCaseString())),
    DropdownMenuItem(
        value: Role.kid, child: Text(Role.kid.toSentenceCaseString())),
    DropdownMenuItem(
        value: Role.other, child: Text(Role.other.toSentenceCaseString())),
  ];
  return roles;
}
