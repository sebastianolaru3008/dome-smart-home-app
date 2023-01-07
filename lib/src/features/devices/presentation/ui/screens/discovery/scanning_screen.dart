import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScanningScreen extends StatelessWidget {
  const ScanningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discovering",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.black54, size: 200),
                  const Icon(Icons.bluetooth_audio,
                      size: 100, color: Colors.black87),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              const Text(
                "Scanning for devices",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
