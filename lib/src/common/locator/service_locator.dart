import 'package:dome_smart_home_app/src/features/example/services/api/example_service.dart';
import 'package:dome_smart_home_app/src/features/example/services/impl/example_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void registerServices() {
  _registerExampleService();
}

void _registerExampleService() {
  locator.registerLazySingleton<ExampleService>(() => ExampleServiceImpl());
}
