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
