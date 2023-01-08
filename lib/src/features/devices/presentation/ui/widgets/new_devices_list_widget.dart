import 'package:flutter/material.dart';

import '../../../domain/device_entity.dart';
import 'new_device_card.dart';

class NewDevicesList extends StatelessWidget {
  final List<DeviceEntity> new_devices;

  const NewDevicesList({Key? key, required this.new_devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: new_devices
                .map((device) => NewDeviceCard(device: device))
                .toList()),
      ),
    );
  }
}
