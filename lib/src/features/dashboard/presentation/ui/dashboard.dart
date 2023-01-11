import 'dart:convert';
import 'dart:developer';

import 'package:dome_smart_home_app/src/common/widgets/custom_appbar.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_event.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_state.dart';
import 'package:dome_smart_home_app/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dome_smart_home_app/src/features/dashboard/presentation/ui/widgets/panic_bottom_sheet.dart';
import 'package:dome_smart_home_app/src/features/devices/devices.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: DashboardUI(),
    );
  }
}

class DashboardUI extends StatefulWidget {
  DashboardUI({Key? key}) : super(key: key);

  bool loaded = false;
  String userImagePath = 'assets/images/users/user.png';

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

TabController? tabController;

class _DashboardUIState extends State<DashboardUI>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var authState = context.read<AuthenticationBloc>().state;
    if (authState is AuthenticationSucceed) {
      var possibleImagePath = 'assets/images/users/${authState.user.name}.png';
      if (!widget.loaded) {
        isLocalAsset(possibleImagePath).then((value) {
          if (value) widget.userImagePath = possibleImagePath;
          log('isLocalAsset: $value');
          setState(() {
            widget.loaded = true;
          });
        });
      }
    }

    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state.areBarsShowing
              ? buildCustomAppBar(
                  title: "Hi User!",
                  leading: InkWell(
                    onTap: () =>
                        context.read<AuthenticationBloc>().add(GoToLoginPage()),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.userImagePath),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: IconButton(
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24.0),
                              ),
                            ),
                            builder: (context) => const PanicBottomSheet()),
                        icon: const Icon(Icons.warning_rounded,
                            color: Colors.red, size: 32),
                      ),
                    )
                  ],
                )
              : null,
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: const [
              Devices(),
              UsersList(),
            ],
          ),
          bottomNavigationBar: state.areBarsShowing
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    elevation: 0,
                    showUnselectedLabels: false,
                    selectedItemColor: Colors.black,
                    currentIndex: state.bottomNavigationIndex,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          size: 32,
                        ),
                        label: 'Devices',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.family_restroom,
                          size: 32,
                        ),
                        label: 'Family',
                      ),
                    ],
                    onTap: (index) {
                      tabController?.animateTo(index);
                      context.read<DashboardBloc>().add(
                            DashboardEventBottomNavigationChanged(index: index),
                          );
                    },
                  ),
                )
              : null,
        );
      },
    );
  }

  Future<bool> isLocalAsset(final String assetPath) async {
    final encoded =
        utf8.encoder.convert(Uri(path: Uri.encodeFull(assetPath)).path);
    final asset = await ServicesBinding.instance.defaultBinaryMessenger
        .send('flutter/assets', encoded.buffer.asByteData());
    return asset != null;
  }
}
