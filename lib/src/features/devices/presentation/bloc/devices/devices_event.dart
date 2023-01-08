part of 'devices_bloc.dart';

abstract class DevicesEvent extends Equatable {
  const DevicesEvent();

  @override
  List<Object?> get props => [];
}

class LoadDevices extends DevicesEvent {}

class GoToScanningScreen extends DevicesEvent {
  final GlobalKey<NavigatorState> navKey;

  const GoToScanningScreen(this.navKey);
}

class GoToDiscoveredDevicesScreen extends DevicesEvent {
  final GlobalKey<NavigatorState> navKey;

  const GoToDiscoveredDevicesScreen(this.navKey);
}
