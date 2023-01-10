import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:meta/meta.dart';

part 'voice_commands_event.dart';
part 'voice_commands_state.dart';

class VoiceCommandsBloc extends Bloc<VoiceCommandsEvent, VoiceCommandsState> {
  VoiceCommandsBloc({required this.devicesService}) : super(VoiceCommandsInitial()) {
    on<ChangeVoiceCommandsState>(_onChangeVoiceCommands);
  }

  final DevicesService devicesService;

  _onChangeVoiceCommands(ChangeVoiceCommandsState event, Emitter<VoiceCommandsState> emit) {
      devicesService.allDevices.forEach((element) {
        if(element.name == event.deviceEntity.name){
          element.voiceCommandsEnabled = event.enabled;
        }
      });
  }
}
