import 'package:flutter/material.dart';

class CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  CustomPageRouteBuilder({
    required this.screen,
    this.transition,
    this.transitionDurationMilliSeconds,
  }) : super(
          pageBuilder: (_, __, ___) => screen,
          transitionDuration:
              Duration(milliseconds: transitionDurationMilliSeconds ?? 225),
          reverseTransitionDuration:
              Duration(milliseconds: transitionDurationMilliSeconds ?? 225),
          transitionsBuilder: transition ?? _defaultTransition,
        );

  final Widget screen;
  RouteTransitionsBuilder? transition;
  int? transitionDurationMilliSeconds;
}

RouteTransitionsBuilder _defaultTransition = (_, animation, ___, child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end);
  final offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
};
