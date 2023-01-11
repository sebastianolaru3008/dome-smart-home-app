import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/timer/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprintf/sprintf.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key, required this.device}) : super(key: key);

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        if (state is TimerInitial) {
          return const Text('00:00:00');
        } else if (state is TimerInitialized) {
          var secondsRemaining = state.secondsRemaining[device.id] ?? 0;
          return Text(
              sprintf('%02d:%02d:%02d', [
                secondsRemaining ~/ 3600,
                secondsRemaining ~/ 60 % 60,
                secondsRemaining % 60
              ]),
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700));
        }

        return Text('--:--:--',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700));
      },
    );
  }
}
