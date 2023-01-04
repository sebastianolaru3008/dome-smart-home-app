import 'package:dome_smart_home_app/src/features/example/domain/example_entity.dart';

import '../api/example_service.dart';

class ExampleServiceImpl implements ExampleService {

  final List<ExampleEntity> entities = [];

  @override
  Future<int> exampleAsyncFunction(int arg1) {
    return Future.delayed(const Duration(milliseconds: 300), () => arg1);
  }

  @override
  int exampleFunction(String arg1, String arg2) {
    return arg1.length + arg2.length;
  }

  @override
  String get exampleGet => "Jo mamma!";
}
