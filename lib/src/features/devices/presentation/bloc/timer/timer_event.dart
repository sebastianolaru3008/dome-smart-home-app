part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class StartTimer extends TimerEvent {
  final DeviceEntity device;

  StartTimer({required this.device});

  @override
  List<Object?> get props => [];
}

class StopTimer extends TimerEvent {
  final DeviceEntity device;

  StopTimer({required this.device});

  @override
  List<Object?> get props => [];
}

class InitializeTimer extends TimerEvent {
  final List<DeviceEntity> devices;

  InitializeTimer({required this.devices});

  @override
  List<Object?> get props => [];
}
