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
      imageAssetPath: "assets/images/devices/window.png",
      state: "Closed",
    ),
    const DeviceEntity(
      name: "Thermo",
      imageAssetPath: "assets/images/devices/nest.png",
      state: "22°C",
    ),
  ];

  List<DeviceEntity> new_devices = [
    const DeviceEntity(
      name: "Alexa",
      full_name: "Amazon Alexa",
      imageAssetPath: "assets/images/devices/alexa.png",
      state: "On, listening",
      type: "Smart Speaker",
    ),
    const DeviceEntity(
      name: "Thermo",
      full_name: "Nest Thermostat",
      imageAssetPath: "assets/images/devices/nest.png",
      state: "22°C",
      type: "Thermostat",
    ),
    const DeviceEntity(
      name: "Living TV",
      full_name: "Philips 55PUS7304",
      imageAssetPath: "assets/images/devices/tv.png",
      state: "Off",
      type: "Smart TV",
    ),
  ];

  @override
  Future<List<DeviceEntity>> getDevices() {
    return Future.delayed(const Duration(milliseconds: 300), () => devices);
  }

  @override
  Future<List<DeviceEntity>> getNewDevices() {
    return Future.delayed(const Duration(milliseconds: 0), () => new_devices);
  }

  @override
  Future<void> addDevice(DeviceEntity device) {
    return Future.delayed(const Duration(milliseconds: 0),
        () => {devices.add(device), new_devices.remove(device)});
  }
}
