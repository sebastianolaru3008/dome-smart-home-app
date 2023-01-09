import 'dart:developer';

import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_state.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/away_at_home_widget.dart';
import 'package:dome_smart_home_app/src/features/users_list/domain/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/device_entity.dart';
import 'add_device_card_widget.dart';
import 'device_card_widget.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({Key? key, required this.devices}) : super(key: key);

  final List<DeviceEntity> devices;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AuthenticationBloc>().state;
    var role = Role.none;
    if (state is AuthenticationSucceed) {
      log("User role is ${state.user.role.toSentenceCaseString()}",
          name: "Devices Overview");
      role = state.user.role;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        role == Role.parent
            ? SizedBox(
                height: 50,
                child: AwayAtHomeWidget(
                    isHome: (context.read<AuthenticationBloc>().state
                            as AuthenticationSucceed)
                        .user
                        .isHome),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My devices',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            children: [
              ...devices
                  .map((device) => DeviceCard(device: device, userRole: role))
                  .toList(),
              role == Role.parent ? AddDeviceCard() : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
