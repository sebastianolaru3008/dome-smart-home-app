import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/devices_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesOverviewScreen extends StatelessWidget {
  const DevicesOverviewScreen({Key? key, required this.navKey}) : super(key: key);

  final GlobalKey<NavigatorState> navKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DevicesBloc, DevicesState>(
        builder: (context, state) {
          if (state is DevicesInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DevicesLoaded) {
            return DevicesOverview(
              devices: state.devices,
              navKey: navKey,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
