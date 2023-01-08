import 'package:dome_smart_home_app/src/features/dashboard/navigators/devices_navigator.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/locator/service_locator.dart';

class Devices extends StatelessWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DevicesBloc(
        devicesService: locator.get<DevicesService>(),
      )..add(LoadDevices()),
      child: const DeviceNavigator(),
    );
  }
}
