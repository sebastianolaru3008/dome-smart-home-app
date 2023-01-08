import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      required this.placeholderText,
      this.obscureText = false,
      required this.icon,
      this.showDone = false,
      required this.getText})
      : super(key: key);

  final String placeholderText;
  final bool obscureText;
  final IconData icon;
  final bool showDone;
  final Function(String) getText;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: Colors.transparent,
      child: TextFormField(
        onChanged: (value) => getText(value),
        obscureText: obscureText,
        textInputAction: showDone ? TextInputAction.done : TextInputAction.next,
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
