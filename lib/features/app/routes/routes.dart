import 'package:dream_book/features/alarm_clock/view/alarm_clock.dart';
import 'package:dream_book/features/app/routes/routes_path.dart';
import 'package:dream_book/features/diary/views/diary.dart';
import 'package:dream_book/features/dreams/view/dreams.dart';
import 'package:dream_book/features/home/view/home.dart';
import 'package:dream_book/features/music/views/music.dart';
import 'package:dream_book/features/profile/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter generateRoute() {
    return GoRouter(routes: [
      GoRoute(
          path: RoutesPath.HOME,
          builder: (BuildContext context, GoRouterState state) => Home(),
          routes: <RouteBase>[
            GoRoute(
              path: RoutesPath.DIARY,
              builder: (BuildContext context, GoRouterState state) => Diary(),
            ),
            GoRoute(
              path: RoutesPath.DREAMS,
              builder: (BuildContext context, GoRouterState state) => Dreams(),
            ),
            GoRoute(
                path: RoutesPath.ALARM_CLOCK,
                builder: (BuildContext context, GoRouterState state) =>
                    AlarmClock(),
                routes: [
                  GoRoute(
                    path: RoutesPath.ALARM_CLOCK_EDIT,
                    builder: (BuildContext context, GoRouterState state) =>
                        Dreams(),
                  )
                ]),
            GoRoute(
              path: RoutesPath.MUSIC,
              builder: (BuildContext context, GoRouterState state) => Music(),
            ),
            GoRoute(
              path: RoutesPath.PROFILE,
              builder: (BuildContext context, GoRouterState state) => Profile(),
            ),
          ])
    ]);
  }
}
