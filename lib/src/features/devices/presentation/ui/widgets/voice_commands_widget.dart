import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/voice_commands/voice_commands_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/voice_command_tile_widget.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/voice_commands_enable_tile_widget.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/add_tile_widget.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/user_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/locator/service_locator.dart';
import '../../../domain/voice_command_entity.dart';

class VoiceCommandsWidget extends StatelessWidget {
   const VoiceCommandsWidget({Key? key, required this.deviceEntity}) : super(key: key);

  final DeviceEntity deviceEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceCommandsBloc(
      devicesService: locator.get<DevicesService>())..add(LoadVoiceCommandsListEvent(deviceEntity: deviceEntity)),
      child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Grandparents",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                    fontSize: 20)),
           VoiceCommandsEnable(deviceEntity.voiceCommandsEnabled,deviceEntity),
            BlocBuilder<VoiceCommandsBloc, VoiceCommandsState>(
              builder: (context, state) {
            if (state is VoiceCommandsListLoaded) {
              return Expanded(
                child: ListView.builder(
                  itemCount: deviceEntity.voiceCommands.length + 1,
                  itemBuilder: (context, index) {
                    if (index == deviceEntity.voiceCommands.length) {
                      return const AddTileWidget(title: "Add voice command",
                        icon: Icon(Icons.keyboard_voice, size: 32,),
                        isUserTile: false,);
                    }
                    return VoiceCommandTileWidget(
                      voiceCommandEntity: deviceEntity.voiceCommands[index],
                      deviceEntity: deviceEntity,);
                  },
                ),
              );
            }
            return const SizedBox();
  },
),
          ],
        ),
      ),
    ),
    );
  }
}
