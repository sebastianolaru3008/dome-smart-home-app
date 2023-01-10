part of 'voice_commands_bloc.dart';

@immutable
abstract class VoiceCommandsState {}


class VoiceCommandsInitial extends VoiceCommandsState{
  @override
  List<Object?> get props => [];
}

class VoiceCommandsListLoaded extends VoiceCommandsState {
  VoiceCommandsListLoaded({required this.listCount, required this.list});

  final int listCount;
  final List<VoiceCommandEntity> list;

  VoiceCommandsListLoaded copyWith({
    int? listCount,
    List<VoiceCommandEntity>? list,
  }) {
    return VoiceCommandsListLoaded(
      list: list ?? this.list,
      listCount: listCount ?? this.listCount,
    );
  }

  @override
  List<Object> get props => [list, listCount];
}
