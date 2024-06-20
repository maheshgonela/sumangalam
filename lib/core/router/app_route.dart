import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RoutePath {
  splash('/'),
  login('/login'),
  home('/home'),
  gateEntry('/home/gateEntry'),
  newGateEntry('/home/gateEntry/newGateEntry'),
  profile('/profile');

  const RoutePath(this.path);
  final String path;
}

extension AppRouteNavigation on RoutePath {
  void go(BuildContext context, {Object? extra}) =>
      context.go(path, extra: extra);

  Future<T?> push<T>(BuildContext context, {Object? extra}) async =>
      await context.push(path, extra: extra);
}
