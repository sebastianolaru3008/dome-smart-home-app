import 'package:flutter/material.dart';

import '../../../domain/device_entity.dart';
import 'new_device_card.dart';

class NewDevicesList extends StatelessWidget {
  const NewDevicesList({Key? key, required this.newDevices}) : super(key: key);

  final List<DeviceEntity> newDevices;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: newDevices
                .map((device) => NewDeviceCard(device: device))
                .toList()),
      ),
    );
  }
}
