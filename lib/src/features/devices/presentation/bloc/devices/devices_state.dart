part of 'devices_bloc.dart';

abstract class DevicesState extends Equatable {
  const DevicesState();

  @override
  List<Object> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is! DevicesState &&
          runtimeType == other.runtimeType;
}

class DevicesInitial extends DevicesState {}

class DevicesLoaded extends DevicesState {
  const DevicesLoaded({required this.devices});

  final List<DeviceEntity> devices;

  @override
  List<Object> get props => [];
}

class DevicesScanning extends DevicesState {}

class DevicesDiscovered extends DevicesState {}
