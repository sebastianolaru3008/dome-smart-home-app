part of 'new_devices_bloc.dart';

abstract class NewDevicesEvent extends Equatable {
  const NewDevicesEvent();

  @override
  List<Object?> get props => [];
}

class LoadNewDevices extends NewDevicesEvent {}
class AddNewDevice extends NewDevicesEvent {
  final DeviceEntity device;
  final BuildContext context;

  const AddNewDevice({required this.device, required this.context});

  @override
  List<Object?> get props => [device];
}