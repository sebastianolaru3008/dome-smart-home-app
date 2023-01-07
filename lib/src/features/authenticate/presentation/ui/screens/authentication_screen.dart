import 'package:dome_smart_home_app/src/features/devices/devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication_bloc.dart';
import '../../bloc/authentication_state.dart';
import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return const LoginWidget();
          }
          if (state is AuthenticationRegister) {
            return const RegisterWidget();
          }
          if (state is AuthenticationSucceed) {
            return const Devices();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
