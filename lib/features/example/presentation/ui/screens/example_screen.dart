import 'package:dome_smart_home_app/features/example/presentation/bloc/example_bloc.dart';
import 'package:dome_smart_home_app/features/example/presentation/ui/widgets/example_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dome'),
      ),
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (context, state) {
          if (state is ExampleDataFetched) {
            return ExampleWidget(
              exampleEntity: state.exampleEntity,
            );
          }
          return const Center(
            child: Text("Press the button to fetch data"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ExampleBloc>().add(ExampleButtonPressed());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
