import '../../domain/device_entity.dart';

abstract class DevicesService {
  Future<List<DeviceEntity>> getDevices();
}
