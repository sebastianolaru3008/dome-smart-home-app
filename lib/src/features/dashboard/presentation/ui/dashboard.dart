import 'package:dome_smart_home_app/src/common/widgets/custom_appbar.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/presentation/bloc/authentication_state.dart';
import 'package:dome_smart_home_app/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dome_smart_home_app/src/features/dashboard/presentation/ui/widgets/panic_bottom_sheet.dart';
import 'package:dome_smart_home_app/src/features/devices/devices.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' as io;

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: const DashboardUI(),
    );
  }
}

class DashboardUI extends StatefulWidget {
  const DashboardUI({Key? key}) : super(key: key);

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
  Widget build(BuildContext context)  {
    var userImagePath = 'assets/images/users/user.png';
    var authState = context
        .read<AuthenticationBloc>()
        .state;
    if (authState is AuthenticationSucceed) {
      var possibleImagePath = 'assets/images/users/${authState.user.name}.png';
       io.File(possibleImagePath).exists().then((
          value) => {
      if(value) {
          userImagePath = possibleImagePath
      }
      });
    }

    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state.areBarsShowing
              ? buildCustomAppBar(
            title: "Hi User!",
            leading: CircleAvatar(
              backgroundImage: AssetImage(userImagePath),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: IconButton(
                  onPressed: () =>
                      showModalBottomSheet(
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
}
