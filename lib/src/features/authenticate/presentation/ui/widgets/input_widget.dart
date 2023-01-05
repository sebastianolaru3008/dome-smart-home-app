import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      required this.placeholderText,
      this.obscureText = false,
      required this.icon})
      : super(key: key);

  final String placeholderText;
  final bool obscureText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: Colors.transparent,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: placeholderText,
          suffixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
