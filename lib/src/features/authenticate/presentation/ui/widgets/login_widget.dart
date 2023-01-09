import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_event.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_state.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/ui/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String email = '';
  String password = '';
  bool isError = false;
  bool accountExists = false;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AuthenticationBloc>().state;
    if (state is AuthenticationInitial) {
      // log(state.hasError.toString());
      isError = state.hasError;
    }
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/login_background.png"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 3,
            ),
            const Text(
              'Log in',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Form(
              child: Column(
                children: [
                  InputWidget(
                      placeholderText: 'Email address',
                      icon: Icons.mail_outline,
                      getText: (text) {
                        email = text;
                      }),
                  const SizedBox(height: 20),
                  InputWidget(
                      placeholderText: 'Password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                      showDone: true,
                      getText: (text) {
                        password = text;
                      }),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: isError,
                    child: Container(
                      // black backgroun
                      // color: Colors.black.withOpacity(0.7),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black54,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Incorrect email or password!",
                            style: TextStyle(
                                color: Colors.red.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.transparent,
                                fontSize: 18)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(RegisterButtonPressed());
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Sign Up'),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(LoginEvent(email: email, password: password));
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Log in'),
            )
          ],
        ),
      ),
    );
  }
}
