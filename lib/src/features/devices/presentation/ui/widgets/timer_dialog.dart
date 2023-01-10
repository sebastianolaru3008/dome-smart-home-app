import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/timer/timer_bloc.dart';

class TimerDialogWidget extends StatelessWidget {
  const TimerDialogWidget({
    Key? key,
    required this.device,
    required this.kidMode,
  }) : super(key: key);

  final DeviceEntity device;
  final bool kidMode;

  @override
  Widget build(BuildContext context) {
    var timerState = context.watch<TimerBloc>().state;
    var timerStarted = false;
    if (timerState is TimerInitialized) {
      timerStarted = timerState.isRunning[device.id] ?? false;
    }
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 288,
          maxWidth: 288,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Spacer(flex: 3),
              const Icon(
                Icons.watch_later_sharp,
                size: 64,
                color: Colors.black,
              ),
              SizedBox(
                height: 8,
              ),
              TimerWidget(device: device),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: () => _startStopTimer(device, context, timerStarted),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: timerStarted ? Text('Stop') : Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _startStopTimer(
      DeviceEntity device, BuildContext context, bool timerStarted) {
    if (timerStarted) {
      context.read<TimerBloc>().add(StopTimer(device: device));
      context.read<DevicesBloc>().add(SwitchDeviceStateEvent(device: device));
    } else {
      context.read<TimerBloc>().add(StartTimer(device: device));
      context.read<DevicesBloc>().add(SwitchDeviceStateEvent(device: device));
    }
  }
}
