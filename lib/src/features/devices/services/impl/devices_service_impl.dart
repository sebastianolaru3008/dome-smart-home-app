import '../../domain/device_entity.dart';
import '../api/devices_service.dart';

class DevicesServiceImpl implements DevicesService {
  List<DeviceEntity> devices = [
    DeviceEntity(
      name: "Alexa",
      imageAssetPath: "assets/images/devices/alexa.png",
      state: "On, listening",
      binaryState: false,
      type: DeviceType.smart_speaker,
      states: const ["On, listening", "Playing music", "Off"],
    ),
    DeviceEntity(
      name: "Living Window",
      imageAssetPath: "assets/images/devices/window.png",
      state: "Closed",
      type: DeviceType.window,
      binaryState: true,
      states: const ["Open", "Closed"],
    ),
    DeviceEntity(
      name: "Thermo",
      imageAssetPath: "assets/images/devices/nest.png",
      state: "On",
      binaryState: true,
      type: DeviceType.thermostat,
      states: const ["On", "Off"],
      temperature: 20,
    ),
  ];

  List<DeviceEntity> new_devices = [
    DeviceEntity(
      name: "Alexa",
      full_name: "Amazon Alexa",
      imageAssetPath: "assets/images/devices/alexa.png",
      state: "On, listening",
      type: DeviceType.smart_speaker,
      binaryState: false,
      states: const ["On, listening", "Playing music", "Off"],
    ),
    DeviceEntity(
      name: "Thermo",
      full_name: "Nest Thermostat",
      imageAssetPath: "assets/images/devices/nest.png",
      state: "On",
      type: DeviceType.thermostat,
      binaryState: true,
      states: const ["On", "Off"],
      temperature: 20,
    ),
    DeviceEntity(
      name: "Living TV",
      full_name: "Philips 55PUS7304",
      imageAssetPath: "assets/images/devices/tv.png",
      state: "Off",
      type: DeviceType.smart_tv,
      binaryState: true,
      states: const ["On", "Off"],
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

  @override
  Future<void> deleteDevice(DeviceEntity device) {
    return Future.delayed(const Duration(milliseconds: 0),
        () => {devices.remove(device), new_devices.add(device)});
  }

  @override
  Future<void> switchDeviceState(DeviceEntity device) {
    return Future.delayed(const Duration(milliseconds: 0), () {
      if (device.binaryState && device.states?.length == 2) {
        var index = devices.indexOf(device);
        device.state = device.state == device.states![0]
            ? device.states![1]
            : device.states![0];
        devices[index] = device;
      }
    });
  }
}
