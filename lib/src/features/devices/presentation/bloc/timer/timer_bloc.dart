import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/device_entity.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (state is TimerInitialized) {
        var secondsRemaining = (state as TimerInitialized).secondsRemaining;
        var isRunning = (state as TimerInitialized).isRunning;
        secondsRemaining.forEach((device, seconds) {
          if (isRunning[device] == true) {
            secondsRemaining[device] = seconds - 1;
          }
          if (secondsRemaining[device] != null && secondsRemaining[device]! <= 0) {
            isRunning[device] = false;
            secondsRemaining[device] = 0;
          }
        });
        // emit copy of state with updated secondsRemaining
        emit(TimerInitialized(
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
      emit(TimerInitialized(
          secondsRemaining: currentState.secondsRemaining
            ..update(event.device.id, (value) => value),
          isRunning: currentState.isRunning
            ..update(event.device.id, (value) => true)));
    });
    on<StopTimer>((event, emit) {
      var currentState = state as TimerInitialized;
      emit(TimerInitialized(
          secondsRemaining: currentState.secondsRemaining
            ..update(event.device.id, (value) => value),
          isRunning: currentState.isRunning
            ..update(event.device.id, (value) => false)));
    });
  }
}
