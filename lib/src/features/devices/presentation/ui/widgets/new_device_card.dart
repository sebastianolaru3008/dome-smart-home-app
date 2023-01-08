import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/new_devices/new_devices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/device_entity.dart';

class NewDeviceCard extends StatelessWidget {
  const NewDeviceCard({Key? key, required this.device}) : super(key: key);

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 70,
      ),
      child: GestureDetector(
        onTap: () {
          context.read<NewDevicesBloc>().add(AddNewDevice(device: device));
        },
        child: Card(
          margin: const EdgeInsets.all(8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      device.full_name ?? device.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: device.type != null
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              device.type!,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
