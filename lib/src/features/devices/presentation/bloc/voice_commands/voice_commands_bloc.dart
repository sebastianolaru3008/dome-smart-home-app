import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:meta/meta.dart';

import '../../../domain/voice_command_entity.dart';

part 'voice_commands_event.dart';
part 'voice_commands_state.dart';

class VoiceCommandsBloc extends Bloc<VoiceCommandsEvent, VoiceCommandsState> {
  VoiceCommandsBloc({required this.devicesService}) : super(VoiceCommandsInitial()) {
    on<ChangeVoiceCommandsState>(_onChangeVoiceCommands);
    on<LoadVoiceCommandsListEvent>(_onLoadVoiceCommandsList);
    on<RemoveVoiceCommandEvent>(_onRemoveVoiceCommand);
    on<AddVoiceCommandEvent>(_onAddVoiceCommand);
  }

  final DevicesService devicesService;

  _onChangeVoiceCommands(ChangeVoiceCommandsState event, Emitter<VoiceCommandsState> emit) {
      devicesService.allDevices.forEach((element) {
        if(element.name == event.deviceEntity.name){
          element.voiceCommandsEnabled = event.enabled;
        }
      });
  }


  _onLoadVoiceCommandsList(LoadVoiceCommandsListEvent event, Emitter<VoiceCommandsState> emit) {
    emit(
      VoiceCommandsListLoaded(
        listCount: event.deviceEntity.voiceCommands.length,
        list: event.deviceEntity.voiceCommands,
      ),
    );
  }

  _onRemoveVoiceCommand(RemoveVoiceCommandEvent event, Emitter<VoiceCommandsState> emit) {
    devicesService.deleteVoiceCommandFromDevice(event.deviceEntity, event.voiceCommandEntity);
    emit(
      VoiceCommandsListLoaded(
        listCount: event.deviceEntity.voiceCommands.length,
        list: event.deviceEntity.voiceCommands,
      ),
    );
  }

  _onAddVoiceCommand(AddVoiceCommandEvent event, Emitter<VoiceCommandsState> emit) {
    devicesService.addVoiceCommandToDevice(event.deviceEntity, event.voiceCommandEntity);
    emit(
      VoiceCommandsListLoaded(
        listCount: event.deviceEntity.voiceCommands.length,
        list: event.deviceEntity.voiceCommands,
      ),
    );
  }
}
