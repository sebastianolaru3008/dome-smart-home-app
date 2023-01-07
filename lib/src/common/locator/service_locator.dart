import 'package:dome_smart_home_app/src/features/example/services/api/example_service.dart';
import 'package:dome_smart_home_app/src/features/example/services/impl/example_service_impl.dart';
import 'package:dome_smart_home_app/src/features/users_list/services/api/users_list_service.dart';
import 'package:dome_smart_home_app/src/features/users_list/services/impl/users_list_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void registerServices() {
  _registerExampleService();
  _registerUsersListService();
}

void _registerExampleService() {
  locator.registerLazySingleton<ExampleService>(() => ExampleServiceImpl());
}

void _registerUsersListService() {
  locator.registerLazySingleton<UsersListService>(() => UsersListServiceImpl());
}
