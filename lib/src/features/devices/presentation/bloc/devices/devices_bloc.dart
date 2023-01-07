import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/screens/discovery/discovered_screen.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/device_entity.dart';
import '../../ui/screens/discovery/scanning_screen.dart';

part 'devices_event.dart';

part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  final DevicesService devicesService;

  DevicesBloc({required this.devicesService})
      : super(DevicesInitial()) {
    on<LoadDevices>(_loadDevices);
    on<GoToScanningScreen>(_goToScanningScreen);
    on<GoToDiscoveredDevicesScreen>(_goToDiscoveredDevicesScreen);
  }

  _loadDevices(_, Emitter<DevicesState> emit) async {
    var devices = await devicesService
        .getDevices();

    emit(DevicesLoaded(devices: devices));

  }

  _goToScanningScreen(GoToScanningScreen event,
      Emitter<DevicesState> emit) async {
    Navigator.of(event.context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const ScanningScreen(),
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
    // wait 3 seconds before loading devices
    await Future.delayed(const Duration(seconds: 3), () {
      add(GoToDiscoveredDevicesScreen(event.context));
    });
  }

  _goToDiscoveredDevicesScreen(GoToDiscoveredDevicesScreen event,
      Emitter<DevicesState> emit) {
    Navigator.of(event.context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const DiscoveredScreen(),
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
