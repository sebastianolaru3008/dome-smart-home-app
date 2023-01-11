import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/timer/timer_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/devices_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesOverview extends StatelessWidget {
  const DevicesOverview({Key? key, required this.devices}) : super(key: key);

  final List<DeviceEntity> devices;

  @override
  Widget build(BuildContext context) {
    var timerBloc = context.read<TimerBloc>();
    if (timerBloc.state is TimerInitial) {
      timerBloc.add(InitializeTimer(devices: devices));
    }
    // context.read<TimerBloc>().add(InitializeTimer(devices: devices));
    return DevicesList(
      devices: devices,
    );
  }
}
