import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../common/navigation/routes.dart';
import '../../../domain/device_entity.dart';
import '../../../services/api/devices_service.dart';

part 'new_devices_event.dart';

part 'new_devices_state.dart';

class NewDevicesBloc extends Bloc<NewDevicesEvent, NewDevicesState> {
  final DevicesService devicesService;

  NewDevicesBloc({required this.devicesService}) : super(NewDevicesInitial()) {
    on<LoadNewDevices>(_loadNewDevices);
    on<AddNewDevice>(_addNewDevice);
  }

  _loadNewDevices(_, Emitter<NewDevicesState> emit) async {
    var devices = await devicesService.getNewDevices();

    emit(NewDevicesLoaded(devices: devices));
  }

  _addNewDevice(AddNewDevice event, Emitter<NewDevicesState> emit) async {
    await devicesService.addDevice(event.device);

    // Get.to(const Devices());

    event.navKey.currentState?.pushNamed(Routes.rootNavigator);

  }
}
