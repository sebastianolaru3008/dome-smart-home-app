import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/device_entity.dart';

part 'devices_event.dart';

part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  final DevicesService devicesService;

  DevicesBloc({required this.devicesService}) : super(DevicesInitial()) {
    on<LoadDevices>(_loadDevices);
    on<GoToScanningScreen>(_goToScanningScreen);
    on<GoToDiscoveredDevicesScreen>(_goToDiscoveredDevicesScreen);
    on<DeleteDeviceEvent>(_deleteDevice);
    on<SwitchDeviceStateEvent>(_switchDeviceState);
  }

  _loadDevices(_, Emitter<DevicesState> emit) async {
    var devices = await devicesService.getDevices();

    emit(DevicesLoaded(devices: devices));
  }

  _goToScanningScreen(
      GoToScanningScreen event, Emitter<DevicesState> emit) async {
    emit(DevicesScanning());
    // wait 3 seconds before loading devices
    await Future.delayed(const Duration(seconds: 3), () {
      add(GoToDiscoveredDevicesScreen());
    });
  }

  _goToDiscoveredDevicesScreen(
      GoToDiscoveredDevicesScreen event, Emitter<DevicesState> emit) {
    emit(DevicesDiscovered());
  }

  _deleteDevice(DeleteDeviceEvent event, Emitter<DevicesState> emit) async {
    emit(DevicesInitial());
    await devicesService.deleteDevice(event.device);
    emit(DevicesLoaded(devices: await devicesService.getDevices()));
  }



  _switchDeviceState(SwitchDeviceStateEvent event, Emitter<DevicesState> emit) async {
    // emit(DevicesInitial());
    await devicesService.switchDeviceState(event.device);
    emit(DevicesLoaded(devices: await devicesService.getDevices()));
  }
}
