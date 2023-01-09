import 'package:flutter/material.dart';

class PanicScenarioButton extends StatelessWidget {
  const PanicScenarioButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 8.0,
        ),
        child: ElevatedButton.icon(
          icon: icon,
          label: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(title, style: const TextStyle(fontSize: 20)),
          ),
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: ContinuousRectangleBorder(
              side: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
      ),
    );
  }
}
