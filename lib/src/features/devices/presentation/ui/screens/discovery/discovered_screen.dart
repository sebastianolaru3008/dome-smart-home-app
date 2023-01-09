import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/new_devices/new_devices_bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/new_devices_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/locator/service_locator.dart';
import '../../../../services/api/devices_service.dart';

class DiscoveredScreen extends StatelessWidget {
  const DiscoveredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            NewDevicesBloc(devicesService: locator.get<DevicesService>())
              ..add(LoadNewDevices()),
        child: Builder(builder: (context) {
          return BlocConsumer<NewDevicesBloc, NewDevicesState>(
            listener: (context, state) {
              if (state is NewDevicesLoaded && state.isNewDeviceAdded) {
                context.read<DevicesBloc>().add(LoadDevices());
              }
            },
            builder: (context, state) {
              if (state is NewDevicesLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Discovered devices",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: NewDevicesList(
                          newDevices: state.devices,
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<DevicesBloc>().add(LoadDevices());
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text('Back to Dashboard'),
                        ),
                        const Padding(padding: EdgeInsets.all(8.0)),
                        ElevatedButton(
                          onPressed: () => context
                              .read<DevicesBloc>()
                              .add(GoToScanningScreen()),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.black,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text("Scan again"),
                        )
                      ],
                    ),
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }),
      ),
    );
  }
}
