part of 'new_devices_bloc.dart';

abstract class NewDevicesState extends Equatable {
  const NewDevicesState();

  @override
  List<Object> get props => [];
}

class NewDevicesInitial extends NewDevicesState {}

class NewDevicesLoaded extends NewDevicesState {
  const NewDevicesLoaded(
      {required this.isNewDeviceAdded, required this.devices});

  final List<DeviceEntity> devices;
  final bool isNewDeviceAdded;

  NewDevicesLoaded copyWith(
      {bool? isNewDeviceAdded, List<DeviceEntity>? devices}) {
    return NewDevicesLoaded(
      isNewDeviceAdded: isNewDeviceAdded ?? this.isNewDeviceAdded,
      devices: devices ?? this.devices,
    );
  }

  @override
  List<Object> get props => [devices, isNewDeviceAdded];
}
