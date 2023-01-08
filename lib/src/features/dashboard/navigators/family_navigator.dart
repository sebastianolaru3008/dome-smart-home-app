import 'package:dome_smart_home_app/src/common/navigation/custom_page_router.dart';
import 'package:dome_smart_home_app/src/common/navigation/routes.dart';
import 'package:dome_smart_home_app/src/features/users_list/presentation/ui/screens/users_list_screen.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> devicesNavigatorKey = GlobalKey<NavigatorState>();

class UsersListNavigator extends StatelessWidget {
  const UsersListNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: devicesNavigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.rootNavigator:
            return CustomPageRouteBuilder(screen: const UsersListScreen());
        }
      },
    );
  }
}
