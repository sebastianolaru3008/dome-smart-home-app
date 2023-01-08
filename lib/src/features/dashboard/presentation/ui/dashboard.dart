import 'package:dome_smart_home_app/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dome_smart_home_app/src/features/dashboard/navigators/family_navigator.dart';
import 'package:dome_smart_home_app/src/features/devices/devices.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/users_list.dart';
import 'package:dome_smart_home_app/src/features/devices/devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          Devices(),
          UsersList(),
        ],
      ),
      bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Container(
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
              currentIndex: state.bottomNavigationIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Devices',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.family_restroom),
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
          );
        },
      ),
    );
  }
}
