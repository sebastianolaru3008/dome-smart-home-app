import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';

class VoiceCommandsEnable extends StatefulWidget {
  final bool enabled;
  const VoiceCommandsEnable(this.enabled);

  @override
  _VoiceCommandsEnableState createState() => _VoiceCommandsEnableState();
}

class _VoiceCommandsEnableState extends State<VoiceCommandsEnable> {

  late bool state;

  @override
  void initState() {
    state = widget.enabled;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      shadowColor: Colors.grey,
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        child: SwitchListTile(
          activeColor: Colors.white,
          activeTrackColor: Colors.black,
          title: const Text("Enable voice commands",style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          value: state,
          onChanged:(bool? value) {
            setState(() {
            state = value!;
          });},),
      ),
    );
  }
}
