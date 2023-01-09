part of 'new_devices_bloc.dart';

abstract class NewDevicesEvent extends Equatable {
  const NewDevicesEvent();

  @override
  List<Object?> get props => [];
}

class LoadNewDevices extends NewDevicesEvent {}

class AddNewDevice extends NewDevicesEvent {
  const AddNewDevice({required this.device});

  final DeviceEntity device;

  @override
  List<Object?> get props => [device];
}
