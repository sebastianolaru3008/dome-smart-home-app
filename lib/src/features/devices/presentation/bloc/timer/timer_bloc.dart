import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/device_entity.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc(DevicesBloc read) : super(TimerInitial()) {

    final devicesBloc = read;

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (state is TimerInitialized) {
        var secondsRemaining = (state as TimerInitialized).secondsRemaining;
        var isRunning = (state as TimerInitialized).isRunning;
        secondsRemaining.forEach((device, seconds) {
          if (isRunning[device] == true) {
            secondsRemaining[device] = seconds - 1;

            if (secondsRemaining[device] != null &&
                secondsRemaining[device]! <= 0) {
              log("Timer for device ${device} has expired");
              isRunning[device] = false;
              secondsRemaining[device] = 0;
              devicesBloc.add(SwitchDeviceStateEvent(deviceId: device));
            }
          }
        });
        // emit copy of state with updated secondsRemaining
        emit((state as TimerInitialized).copyWith(
            secondsRemaining: secondsRemaining, isRunning: isRunning));
      }
    });
    on<TimerEvent>((event, emit) {});
    on<InitializeTimer>((event, emit) {
      var secondsRemaining = <int, int>{};
      var isRunning = <int, bool>{};
      event.devices.forEach((device) {
        secondsRemaining[device.id] = device.timer ?? 0;
        isRunning[device.id] = false;
      });
      log(secondsRemaining.toString(), name: 'InitializeTimer');
      emit(TimerInitialized(
          secondsRemaining: secondsRemaining, isRunning: isRunning));
    });
    on<StartTimer>((event, emit) {
      var currentState = state as TimerInitialized;
      emit(currentState.copyWith(
          secondsRemaining: currentState.secondsRemaining
            ..update(event.device.id, (value) => value),
          isRunning: currentState.isRunning
            ..update(event.device.id, (value) => true),));
      devicesBloc.add(SwitchDeviceStateEvent(deviceId: event.device.id));
    });
    on<StopTimer>((event, emit) {
      var currentState = state as TimerInitialized;
      emit(currentState.copyWith(
          secondsRemaining: currentState.secondsRemaining
            ..update(event.device.id, (value) => value),
          isRunning: currentState.isRunning
            ..update(event.device.id, (value) => false)));
      devicesBloc.add(SwitchDeviceStateEvent(deviceId: event.device.id));
    });
  }
}
