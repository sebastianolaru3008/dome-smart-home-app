import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/button_empty_widget.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.dialogTitle,
    required this.textEmptyButton,
    required this.textFullButton,
    required this.onCancelCallback,
    required this.onFullCallback,
  }) : super(key: key);

  final String textEmptyButton;
  final String textFullButton;
  final String dialogTitle;
  final VoidCallback onCancelCallback;
  final VoidCallback onFullCallback;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 146,
        width: 288,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          child: Column(
            children: [
              Text(dialogTitle,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600)),
              const Spacer(),
              Row(
                children: [
                  ButtonWidget(
                    text: textEmptyButton,
                    onPressed: onCancelCallback,
                    isPrimary: false,
                  ),
                  const Spacer(),
                  ButtonWidget(
                    text: textFullButton,
                    onPressed: onFullCallback,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
