import 'package:apptest/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

@TypedGoRoute<ChoiceRoute>(
  path: '/',
  routes: [
    TypedGoRoute<DateOfBirthRoute>(path: 'date-of-birth'),
    TypedGoRoute<ResultRoute>(path: 'result'),
  ],
)
class ChoiceRoute extends GoRouteData {
  const ChoiceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ChoicePage(
        onNext: () => const DateOfBirthRoute().pushReplacement(context),
      );
}

class DateOfBirthRoute extends GoRouteData {
  const DateOfBirthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => DateOfBirthPage(
        onNext: () => const ResultRoute().pushReplacement(context),
      );
}

class ResultRoute extends GoRouteData {
  const ResultRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ResultPage();
}
