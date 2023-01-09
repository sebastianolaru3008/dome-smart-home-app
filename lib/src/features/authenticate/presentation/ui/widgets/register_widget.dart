import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication_bloc.dart';
import 'input_widget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
   //RegisterWidget({Key? key}) : super(key: key);

  String email = '';
  String name = '';
  String password = '';
  bool isError=false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<AuthenticationBloc>().add(GoToLoginPage());
        return false;
      },
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/register_background.png"),
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
                'Sign Up',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Form(
                child: Column(
                  children:  [
                    InputWidget(
                        placeholderText: 'Name', icon: Icons.person_outline,
                        getText: (text){ name = text;}),
                    SizedBox(height: 15),
                    InputWidget(
                        placeholderText: 'Email address',
                        icon: Icons.mail_outline,
                        getText: (text){email = text;}),
                    SizedBox(height: 15),
                    InputWidget(
                        placeholderText: 'Password',
                        icon: Icons.lock_outline,
                        obscureText: true,
                        getText: (text){password = text;}),
                    SizedBox(height: 15),
                    InputWidget(
                      placeholderText: 'Repeat password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                      showDone: true,
                        getText: (text){
                        if(password != text && text!=""){
                          print("aa");
                          setState(() {isError=true; });
                        }else{
                          setState(() {isError=false; });
                        }
                      }
                    ),
                    SizedBox(height: 15),
                    Visibility(
                      visible: isError,
                      child: const Text("Passwords don't coincide!",
                          style: TextStyle(color: Colors.red,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white,
                              fontSize: 18
                          )),
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(AuthenticateUser(name: name,email: email,password: password));
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
