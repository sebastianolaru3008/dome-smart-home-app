import 'package:dome_smart_home_app/src/features/devices/domain/voice_command_entity.dart';
import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  DeviceEntity({
    required this.name,
    this.full_name,
    this.imageAssetPath,
    this.state,
    this.type,
    this.temperature,
    required this.binaryState,
    this.brightness,
    this.volume,
    this.states,
    required this.voiceCommands,
    required this.voiceCommandsEnabled
  });

  final String name;
  final String? full_name;
  final String? imageAssetPath;
  String? state;
  final DeviceType? type;
  final int? temperature;
  final bool binaryState;
  final int? brightness;
  final int? volume;
  final List<String>? states;
  final List<VoiceCommandEntity> voiceCommands;
  bool voiceCommandsEnabled;

  @override
  List<Object?> get props => [
        name,
        full_name,
        imageAssetPath,
        state,
        type,
        temperature,
        binaryState,
        brightness,
        volume,
        states,
    voiceCommands,
    voiceCommandsEnabled
      ];

  @override
  String getState() {
    String returnState = "";
    returnState += state ?? "";
    returnState += temperature != null ? ", $temperature°C" : "";
    returnState += brightness != null ? ", $brightness%" : "";
    returnState += volume != null ? ", $volume%" : "";
    return returnState;
  }
}

enum DeviceType {
  smart_speaker,
  light,
  thermostat,
  camera,
  door_lock,
  other,
  none,
  smart_tv,
  window,
  door,
}

extension ParseToString on DeviceType {
  String toSentenceCaseString() {
    var word = this.toString().split('.').last.replaceAll('_', ' ');
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
}
