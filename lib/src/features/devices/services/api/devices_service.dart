import '../../domain/device_entity.dart';

abstract class DevicesService {
  Future<List<DeviceEntity>> getDevices();
  Future<List<DeviceEntity>> getNewDevices();
  Future<void> addDevice(DeviceEntity device);
  Future<void> deleteDevice(DeviceEntity device);
  Future<void> switchDeviceState(DeviceEntity device);
  List<DeviceEntity> get allDevices;
}
