part of 'devices_bloc.dart';

abstract class DevicesEvent extends Equatable {
  const DevicesEvent();

  @override
  List<Object?> get props => [];
}

class LoadDevices extends DevicesEvent {}

class GoToScanningScreen extends DevicesEvent {
  final BuildContext context;

  GoToScanningScreen(this.context);
}

class GoToDiscoveredDevicesScreen extends DevicesEvent {
  final BuildContext context;

  GoToDiscoveredDevicesScreen(this.context);
}
