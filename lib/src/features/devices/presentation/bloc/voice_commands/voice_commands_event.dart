part of 'voice_commands_bloc.dart';

@immutable
abstract class VoiceCommandsEvent {}

class ChangeVoiceCommandsState extends VoiceCommandsEvent {
  ChangeVoiceCommandsState({required this.deviceEntity, required this.enabled});

  final DeviceEntity deviceEntity;
  final bool enabled;

  @override
  List<Object?> get props => [deviceEntity,enabled];
}

class RemoveVoiceCommandEvent extends VoiceCommandsEvent {
  RemoveVoiceCommandEvent({required this.deviceEntity, required this.voiceCommandEntity});

  final DeviceEntity deviceEntity;
  final VoiceCommandEntity voiceCommandEntity;

  @override
  List<Object?> get props => [deviceEntity,voiceCommandEntity];
}

class LoadVoiceCommandsListEvent extends VoiceCommandsEvent {
  LoadVoiceCommandsListEvent({required this.deviceEntity});
  final DeviceEntity deviceEntity;
  @override
  List<Object?> get props => [deviceEntity];
}

class AddVoiceCommandEvent extends VoiceCommandsEvent {
  AddVoiceCommandEvent({required this.deviceEntity, required this.voiceCommandEntity});

  final DeviceEntity deviceEntity;
  final VoiceCommandEntity voiceCommandEntity;

  @override
  List<Object?> get props => [deviceEntity, voiceCommandEntity];
}