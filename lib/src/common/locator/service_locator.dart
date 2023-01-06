import 'package:dome_smart_home_app/src/features/authenticate/services/api/authentication_service.dart';
import 'package:dome_smart_home_app/src/features/authenticate/services/impl/authentication_service_impl.dart';
import 'package:dome_smart_home_app/src/features/example/services/api/example_service.dart';
import 'package:dome_smart_home_app/src/features/example/services/impl/example_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void registerServices() {
  _registerExampleService();
  _registerAuthenticationService();
}

void _registerExampleService() {
  locator.registerLazySingleton<ExampleService>(() => ExampleServiceImpl());
}

void _registerAuthenticationService() {
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationServiceImpl());
}
