import 'package:dome_smart_home_app/src/features/devices/presentation/bloc/devices/devices_bloc.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDeviceCard extends StatelessWidget {
  const AddDeviceCard({Key? key, required this.navKey}) : super(key: key);

  final GlobalKey<NavigatorState> navKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.black38,
        strokeWidth: 4,
        dashPattern: const [15, 10],
        radius: const Radius.circular(10),
        child: GestureDetector(
          onTap: () =>
              context.read<DevicesBloc>().add(GoToScanningScreen(navKey)),
          child: Card(
            margin: const EdgeInsets.all(8),
            color: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.black38,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Add new Device',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
