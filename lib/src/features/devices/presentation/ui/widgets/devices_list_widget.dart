import 'package:flutter/material.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Device1'),
        Text('Device2'),
        Text('Device3'),
      ],
    );
  }
}
