import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/button_empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/ui/widgets/input_widget.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/voice_commands/voice_commands_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/domain/voice_command_entity.dart';


class VoiceCommandsAddDialog extends StatelessWidget {
  VoiceCommandsAddDialog({
    Key? key,
    required this.deviceEntity,
    required this.onSave,
  }) : super(key: key);

  final DeviceEntity deviceEntity;
  Function(String) onSave;

  @override
  Widget build(BuildContext context) {
    String name ='';
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 288,
        width: 288,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          child: Column(
            children: [
              Text(
                  "Record voice command",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              const Spacer(),
              InputWidget(
                  placeholderText: 'Name',
                  icon: Icons.record_voice_over,
                  getText: (text) {
                    name=text;
                  }),
              const Spacer(),
              Row(
                children: [
                  ButtonWidget(
                    text: "Cancel",
                    onPressed:() {
                      Navigator.pop(context);
                    },
                    isPrimary: false,
                  ),
                  const Spacer(),
                  ButtonWidget(
                    text: "Save",
                    onPressed:(){
                      onSave(name);
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
