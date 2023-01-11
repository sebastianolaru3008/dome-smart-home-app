import 'dart:developer';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authenticate/presentation/bloc/authentication_event.dart';

class AwayAtHomeWidget extends StatefulWidget {
  AwayAtHomeWidget({Key? key, required this.isHome}) : super(key: key);

  final List<String> labels = ['Away', 'Home'];
  final List<IconData> icons = [Icons.directions_walk, Icons.home];
  final bool isHome;

  @override
  State<AwayAtHomeWidget> createState() =>
      _AwayAtHomeWidgetState(isHome: isHome);
}

class _AwayAtHomeWidgetState extends State<AwayAtHomeWidget> {
  bool isHome;
  bool loading = false;

  _AwayAtHomeWidgetState({required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          const Text('Away', style: TextStyle(fontSize: 20)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AnimatedToggleSwitch<String>.dual(
              current: isHome ? "Home" : "Away",
              first: "Away",
              second: "Home",
              dif: 50,
              height: 40,
              colorBuilder: (current) {
                if (current == "Away") {
                  return Colors.black;
                } else {
                  return Colors.white;
                }
              },
              borderColor: Colors.white,
              borderWidth: 3,
              indicatorSize: const Size(100, double.infinity),
              indicatorBorderRadius: BorderRadius.circular(20),
              indicatorBorder: Border.all(
                color: Colors.black,
                width: 3,
              ),
              loading: loading,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
              onChanged: (current) {
                log(current.toString());
                if (current == "Away") {
                  _setAway();
                } else {
                  _setHome();
                }
                return !isHome;
              },
              onTap: () {
                // log(isHome.toString());

                _setIsHome(!isHome);
                // log(isHome.toString());
              },
            ),
          ),
          const Spacer(),
          const Text('Home', style: TextStyle(fontSize: 20)),
          const Spacer(),
        ],
      ),
    );
  }

  void _setAway() {
    _setIsHome(false);
  }

  void _setHome() {
    _setIsHome(true);
  }

  void _setIsHome(bool isHome) {
    var user =
        (context.read<AuthenticationBloc>().state as AuthenticationSucceed)
            .user;
    setState(() {
      this.loading = true;
    });
    context.read<AuthenticationBloc>().add(SetIsHomeEvent(
        user: user,
        isHome: isHome,
        callback: () {
          setState(() {
            log(isHome.toString(), name: 'isHome');
            this.isHome = isHome;
            this.loading = false;
          });
        }));
  }
}
