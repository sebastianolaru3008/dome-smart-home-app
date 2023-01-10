import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/button_empty_widget.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.dialogTitle,
    this.dialogContent,
    required this.textEmptyButton,
    required this.textFullButton,
    required this.onCancelCallback,
    required this.onFullCallback,
  }) : super(key: key);

  final String textEmptyButton;
  final String textFullButton;
  final String dialogTitle;
  final String? dialogContent;
  final VoidCallback onCancelCallback;
  final VoidCallback onFullCallback;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 146,
          maxWidth: 288,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dialogTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              dialogContent != null
                  ? Text(
                      dialogContent!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 24),
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
