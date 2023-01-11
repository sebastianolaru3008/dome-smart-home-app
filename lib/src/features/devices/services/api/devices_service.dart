import 'package:dome_smart_home_app/src/features/devices/domain/voice_command_entity.dart';

import '../../domain/device_entity.dart';

abstract class DevicesService {
  Future<List<DeviceEntity>> getDevices();
  Future<List<DeviceEntity>> getNewDevices();
  Future<void> addDevice(DeviceEntity device);
  Future<void> deleteDevice(DeviceEntity device);
  List<DeviceEntity> get allDevices;
  void addVoiceCommandToDevice(DeviceEntity deviceEntity, VoiceCommandEntity voiceCommand);
  void deleteVoiceCommandFromDevice(DeviceEntity deviceEntity, VoiceCommandEntity voiceCommandEntity);
  Future<void> switchDeviceState(int deviceId);
}
