import 'package:dome_smart_home_app/src/features/authenticate/presentation/ui/screens/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/locator/service_locator.dart';
import '../services/api/authentication_service.dart';
import 'bloc/authentication_bloc.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
          authenticationService: locator.get<AuthenticationService>(),
          ),
      child: const AuthenticationScreen(),
    );
  }
}
