part of 'voice_commands_bloc.dart';

@immutable
abstract class VoiceCommandsState {}

class VoiceCommandsInitial extends VoiceCommandsState {}
class VoiceCommandsEnabled extends VoiceCommandsState {}
class VoiceCommandsDisabled extends VoiceCommandsState {}
