import 'package:dome_smart_home_app/src/common/locator/service_locator.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/authenticate.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/timer/timer_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  registerServices();

  runApp(
    MultiBlocProvider(
      providers: [

        BlocProvider<DevicesBloc>(
          create: (context) => DevicesBloc(
            devicesService: locator.get<DevicesService>(),
          )..add(LoadDevices()),
        ),
        BlocProvider<TimerBloc>(
          create: (context) => TimerBloc(context.read<DevicesBloc>()),
        ),
      ],
      child: DomeApp(),
    ),
  );
}

class DomeApp extends StatelessWidget {
  const DomeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}
