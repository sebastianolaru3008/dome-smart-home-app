import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_state.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/ui/widgets/login_widget.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/ui/widgets/register_widget.dart';
import 'package:dome_smart_home_app/src/features/dashboard/presentation/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return const Dashboard();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
