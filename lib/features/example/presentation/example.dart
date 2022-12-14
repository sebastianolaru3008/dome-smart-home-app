import 'package:dome_smart_home_app/common/locator/service_locator.dart';
import 'package:dome_smart_home_app/features/example/presentation/bloc/example_bloc.dart';
import 'package:dome_smart_home_app/features/example/presentation/ui/screens/example_screen.dart';
import 'package:dome_smart_home_app/features/example/services/api/example_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExampleBloc(
        exampleService: locator.get<ExampleService>(),
      ),
      child: const ExampleScreen(),
    );
  }
}
