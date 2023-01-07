part of 'new_devices_bloc.dart';

abstract class NewDevicesState extends Equatable {
  const NewDevicesState();

  @override
  List<Object> get props => [];
}

class NewDevicesInitial extends NewDevicesState {}

class NewDevicesLoaded extends NewDevicesState {
  const NewDevicesLoaded({required this.devices});

  final List<DeviceEntity> devices;

  @override
  List<Object> get props => [];
}
