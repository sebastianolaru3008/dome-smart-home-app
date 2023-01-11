import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/voice_commands_widget.dart';
import 'package:dome_smart_home_app/src/features/users_list/domain/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/navigation/routes.dart';
import '../../../../users_list/presentation/ui/widgets/dialog_widget.dart';

class DeviceCard extends StatelessWidget {
  final DeviceEntity device;
  final Role userRole;

  const DeviceCard({Key? key, required this.device, required this.userRole})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (userRole) {
          case Role.parent:
            //Navigator.pushNamed(context, Routes.deviceOverview);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VoiceCommandsWidget( deviceEntity: device,)),
            );
            break;
          case Role.kid:
            _showTimerDialog(context);
            break;
          case Role.grandparent:
            _switchDeviceState(context);
            break;
          case Role.other:
            // TODO: Handle this case.
            break;
          case Role.none:
            // TODO: Handle this case.
            break;
        }
      },
      onLongPress: () {
        if (userRole == Role.parent) {
          _showDeviceDeleteDialog(context);
        }
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        child: Container(
          decoration: device.imageAssetPath != null
              ? BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(device.imageAssetPath!),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                )
              : null,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        device.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            device.getState(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeviceDeleteDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext childContext) {
        return DialogWidget(
          dialogTitle: "Are you sure you want to delete this device?",
          textEmptyButton: "No, cancel",
          textFullButton: "Yes, delete",
          onCancelCallback: () {
            Navigator.pop(childContext);
          },
          onFullCallback: () {
            context.read<DevicesBloc>().add(DeleteDeviceEvent(device: device));
            Navigator.pop(childContext);
          },
        );
      },
    );
  }

  void _showTimerDialog(BuildContext context) {
    // TODO: Implement timer dialog
  }

  void _switchDeviceState(BuildContext context) {
    context.read<DevicesBloc>().add(SwitchDeviceStateEvent(device: device));
  }
}
