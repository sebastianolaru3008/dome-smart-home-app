import '../../domain/device_entity.dart';
import '../../domain/voice_command_entity.dart';

abstract class DevicesService {
  Future<List<DeviceEntity>> getDevices();
  Future<List<DeviceEntity>> getNewDevices();
  Future<void> addDevice(DeviceEntity device);
  Future<void> deleteDevice(DeviceEntity device);
  Future<void> switchDeviceState(DeviceEntity device);
  List<DeviceEntity> get allDevices;
  void addVoiceCommandToDevice(DeviceEntity deviceEntity, VoiceCommandEntity voiceCommand);
  void deleteVoiceCommandFromDevice(DeviceEntity deviceEntity, VoiceCommandEntity voiceCommandEntity);
}
