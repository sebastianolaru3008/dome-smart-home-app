import 'package:dome_smart_home_app/src/common/locator/service_locator.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/authenticate.dart';
import 'package:flutter/material.dart';

void main() {
  registerServices();

  runApp(const DomeApp());
}

class DomeApp extends StatelessWidget {
  const DomeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Authenticate(),
    );
  }
}
