import '../../domain/device_entity.dart';
import '../api/devices_service.dart';

class DevicesServiceImpl implements DevicesService {
  List<DeviceEntity> devices = [
    const DeviceEntity(
      name: "Alexa",
      imageAssetPath: "assets/images/devices/alexa.png",
      state: "On, listening",
    ),
    const DeviceEntity(
      name: "Living Window",
      imageAssetPath:"assets/images/devices/window.png",
      state: "Closed",
    ),
    const DeviceEntity(
      name: "Thermo",
      imageAssetPath:"assets/images/devices/nest.png",
      state: "22°C",
    ),
  ];

  @override
  Future<List<DeviceEntity>> getDevices() {
    return Future.delayed(const Duration(milliseconds: 300), () => devices);
  }
}
