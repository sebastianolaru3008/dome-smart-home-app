import 'package:dome_smart_home_app/src/features/example/presentation/example.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddTileWidget extends StatelessWidget {
  const AddTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Example();
          }));
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.grey.shade500,
          radius: const Radius.circular(12.0),
          strokeWidth: 2,
          dashPattern: const [17, 20],
          child: SizedBox(
            height: 56,
            child: ListTile(
              leading: const Icon(
                Icons.add,
                size: 32,
              ),
              title: Text(
                "Add new user",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
