import 'package:dome_smart_home_app/src/features/devices/domain/device_entity.dart';
import 'package:dome_smart_home_app/src/features/devices/presentation/ui/widgets/devices_list_widget.dart';
import 'package:flutter/cupertino.dart';

class DevicesOverview extends StatelessWidget {
  const DevicesOverview({Key? key, required this.devices}) : super(key: key);

  final List<DeviceEntity> devices;

  @override
  Widget build(BuildContext context) {
    return DevicesList(
      devices: devices,
    );
  }
}
