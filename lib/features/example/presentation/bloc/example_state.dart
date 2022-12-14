part of 'example_bloc.dart';

abstract class ExampleState extends Equatable {
  const ExampleState();
}

class ExampleInitial extends ExampleState {
  @override
  List<Object> get props => [];
}

class ExampleDataFetched extends ExampleState {
  const ExampleDataFetched({required this.exampleEntity});

  final ExampleEntity exampleEntity;

  @override
  List<Object> get props => [];
}
