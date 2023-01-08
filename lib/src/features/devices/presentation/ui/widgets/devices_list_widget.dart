import 'package:flutter/material.dart';

import '../../../domain/device_entity.dart';
import 'add_device_card_widget.dart';
import 'device_card_widget.dart';

class DevicesList extends StatelessWidget {
  final List<DeviceEntity> devices;

  const DevicesList({
    Key? key,
    required this.devices, required this.navKey,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My devices',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            children: [
              ...devices.map((device) => DeviceCard(device: device)).toList(),
              AddDeviceCard(navKey: navKey),
            ],
          ),
        ),
      ],
    );
  }
}
