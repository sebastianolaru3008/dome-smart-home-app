import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/features/example/domain/example_entity.dart';
import 'package:dome_smart_home_app/features/example/services/api/example_service.dart';
import 'package:equatable/equatable.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc({
    required this.exampleService,
  }) : super(ExampleInitial()) {
    on<ExampleEvent>(_onExampleEvent);
  }

  final ExampleService exampleService;

  void _onExampleEvent(ExampleEvent event, Emitter<ExampleState> emit) {
    emit(
      ExampleDataFetched(
        exampleEntity: ExampleEntity(
          requiredArg: exampleService.exampleGet,
        ),
      ),
    );
  }
}
