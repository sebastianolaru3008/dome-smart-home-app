
import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/devices.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/device_entity.dart';
import '../../../services/api/devices_service.dart';

part 'new_devices_event.dart';
part 'new_devices_state.dart';

class NewDevicesBloc extends Bloc<NewDevicesEvent, NewDevicesState> {
  final DevicesService devicesService;

  NewDevicesBloc({required this.devicesService})
      : super(NewDevicesInitial()) {
    on<LoadNewDevices>(_loadNewDevices);
    on<AddNewDevice>(_addNewDevice);
  }

  _loadNewDevices(_, Emitter<NewDevicesState> emit) async {
    var devices = await devicesService
        .getNewDevices();

    emit(NewDevicesLoaded(devices: devices));

  }

  _addNewDevice(AddNewDevice event, Emitter<NewDevicesState> emit) async {
    await devicesService
        .addDevice(event.device);

    Navigator.of(event.context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const Devices(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
