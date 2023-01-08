import 'package:dome_smart_home_app/src/common/navigation/custom_page_router.dart';
import 'package:dome_smart_home_app/src/common/navigation/routes.dart';
import 'package:dome_smart_home_app/src/features/example/presentation/example.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> devicesNavigatorKey = GlobalKey<NavigatorState>();

class FamilyNavigator extends StatelessWidget {
  const FamilyNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: devicesNavigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.rootNavigator:
            return CustomPageRouteBuilder(screen: const Example());
        }
      },
    );
  }
}
