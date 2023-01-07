import 'package:dome_smart_home_app/src/features/example/domain/example_entity.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/button_empty_widget.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/button_full_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/user_entity.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key, required this.dialogTitle, required this.textEmptyButton, required this.textFullButton}) : super(key: key);

  final String textEmptyButton;
  final String textFullButton;
  final String dialogTitle;


  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 146,
        width: 288,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 40),
          child: Column(
            children: [
              Text(dialogTitle,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
              const Spacer(),
              Row(
                children: [
                  ButtonEmptyWidget(text: textEmptyButton),
                  const Spacer(),
                  ButtonFullWidget(text: textFullButton)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
