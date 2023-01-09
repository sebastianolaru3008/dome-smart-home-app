import 'dart:developer';

import 'package:dome_smart_home_app/src/common/navigation/custom_page_router.dart';
import 'package:dome_smart_home_app/src/common/navigation/routes.dart';
import 'package:dome_smart_home_app/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/screens/devices_overview_screen.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/screens/discovery/discovered_screen.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/screens/discovery/scanning_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<NavigatorState> devicesNavigatorKey = GlobalKey<NavigatorState>();

class DeviceNavigator extends StatelessWidget {
  const DeviceNavigator({Key? key}) : super(key: key);

  static String currentRoute = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<DevicesBloc, DevicesState>(
      listener: (context, state) {
        log("Devices state is $state", name: "Devices Navigator");
        if (state is DevicesLoaded &&
            DeviceNavigator.currentRoute != Routes.rootNavigator) {
          context
              .read<DashboardBloc>()
              .add(const DashboardEventShowBars(areBarsShowing: true));
          devicesNavigatorKey.currentState?.pushReplacementNamed(
            Routes.rootNavigator,
            arguments: state.devices,
          );
        }
        if (state is DevicesScanning) {
          context
              .read<DashboardBloc>()
              .add(const DashboardEventShowBars(areBarsShowing: false));
          devicesNavigatorKey.currentState?.pushNamed(Routes.devicesScanning);
        }
        if (state is DevicesDiscovered) {
          devicesNavigatorKey.currentState?.pushNamed(Routes.devicesDiscovery);
        }
      },
      child: Navigator(
        key: devicesNavigatorKey,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.rootNavigator:
              DeviceNavigator.currentRoute = Routes.rootNavigator;
              return CustomPageRouteBuilder(
                transitionDurationMilliSeconds: 0,
                screen: const DevicesOverviewScreen(),
              );
            case Routes.devicesScanning:
              DeviceNavigator.currentRoute = Routes.devicesScanning;
              return CustomPageRouteBuilder(
                screen: const ScanningScreen(),
              );
            case Routes.devicesDiscovery:
              DeviceNavigator.currentRoute = Routes.devicesDiscovery;
              return CustomPageRouteBuilder(
                screen: const DiscoveredScreen(),
              );
          }
        },
      ),
    );
  }
}
