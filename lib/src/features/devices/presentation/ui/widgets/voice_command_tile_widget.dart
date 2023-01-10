import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';


class VoiceCommandTileWidget extends StatelessWidget {
  const VoiceCommandTileWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      shadowColor: Colors.grey,
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        child: ListTile(
          title: Text(text,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          trailing: const Icon(Icons.keyboard_voice, color: Colors.black,),
        ),
      ),
    );
  }
}
