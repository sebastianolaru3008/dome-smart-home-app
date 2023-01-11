part of 'devices_bloc.dart';

abstract class DevicesEvent extends Equatable {
  const DevicesEvent();

  @override
  List<Object?> get props => [];
}

class LoadDevices extends DevicesEvent {}

class GoToScanningScreen extends DevicesEvent {}

class GoToDiscoveredDevicesScreen extends DevicesEvent {}

class DeleteDeviceEvent extends DevicesEvent {
  const DeleteDeviceEvent({required this.device});

  final DeviceEntity device;

  @override
  List<Object?> get props => [device];
}

class SwitchDeviceStateEvent extends DevicesEvent {
  const SwitchDeviceStateEvent({this.device, this.deviceId});

  final DeviceEntity? device;
  final int? deviceId;

  @override
  List<Object?> get props => [device];
}