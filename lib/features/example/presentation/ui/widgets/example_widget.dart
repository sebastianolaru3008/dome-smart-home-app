import 'package:dome_smart_home_app/features/example/domain/example_entity.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key, required this.exampleEntity}) : super(key: key);

  final ExampleEntity exampleEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(exampleEntity.requiredArg),
    );
  }
}
