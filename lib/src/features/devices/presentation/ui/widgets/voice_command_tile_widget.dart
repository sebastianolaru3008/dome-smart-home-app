import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/domain/voice_command_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/voice_commands/voice_commands_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class VoiceCommandTileWidget extends StatelessWidget {
  const VoiceCommandTileWidget({Key? key, required this.voiceCommandEntity, required this.deviceEntity}) : super(key: key);

  final VoiceCommandEntity voiceCommandEntity;
  final DeviceEntity deviceEntity;

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
                dialogTitle: "Do you want to delete this voice command?",
                textEmptyButton: "No, cancel",
                textFullButton: "Yes, delete",
                onCancelCallback: () {
                  Navigator.pop(childContext);
                },
                onFullCallback: () {
                  context
                      .read<VoiceCommandsBloc>()
                      .add(RemoveVoiceCommandEvent(deviceEntity: deviceEntity, voiceCommandEntity: voiceCommandEntity));
                  Navigator.pop(childContext);
                },
              );
            },
          );
        },
        child: ListTile(
          title: Text(voiceCommandEntity.name,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          trailing: const Icon(Icons.keyboard_voice, color: Colors.black,),
        ),
      ),
    );
  }
}
