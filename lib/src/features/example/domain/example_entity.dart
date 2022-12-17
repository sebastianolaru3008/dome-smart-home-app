import 'package:equatable/equatable.dart';

class ExampleEntity extends Equatable {
  const ExampleEntity({
    required this.requiredArg,
    this.nullableArg,
  });

  final String requiredArg;
  final String? nullableArg;

  @override
  List<Object?> get props => [requiredArg, nullableArg];
}
