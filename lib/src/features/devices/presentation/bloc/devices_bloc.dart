import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/device_entity.dart';

part 'devices_event.dart';

part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  final DevicesService devicesService;

  DevicesBloc({required this.devicesService}) : super(DevicesInitial()) {
    on<LoadDevices>(_loadDevices);
  }

  _loadDevices(_, Emitter<DevicesState> emit) async {
    await devicesService
        .getDevices()
        .then((value) => emit(DevicesLoaded(devices: value)));
  }
}
