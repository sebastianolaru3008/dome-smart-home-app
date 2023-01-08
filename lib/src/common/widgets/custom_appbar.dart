import 'package:flutter/material.dart';

AppBar buildCustomAppBar({
  required String title,
  List<Widget> actions = const [],
  Widget? leading,
  VoidCallback? onBackButtonPress,
}) =>
    AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leadingWidth: 72,
      toolbarHeight: 72,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: leading ??
            (onBackButtonPress != null
                ? const Icon(
                    Icons.arrow_back,
                    size: 32,
                  )
                : null),
      ),
      title: const Text(
        'Dashboard',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: actions,
    );
