import 'package:dream_book/modules/alarm_clock/alarm_clock_screen.dart';
import 'package:dream_book/modules/diary/diary_screen.dart';
import 'package:dream_book/modules/dreams/dreams_screen.dart';
import 'package:dream_book/modules/home/home_binding.dart';
import 'package:dream_book/modules/home/home_screen.dart';
import 'package:dream_book/modules/music/music_screen.dart';
import 'package:dream_book/modules/profile/profile_screen.dart';
import 'package:get/route_manager.dart';

part "app_routes.dart";

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = {
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: Routes.DIARY,
            page: () => DiaryScreen(),
          ),
          GetPage(
            name: Routes.DREAMS,
            page: () => DreamsScreen(),
          ),
          GetPage(
            name: Routes.MUSIC,
            page: () => MusicScreen(),
          ),
          GetPage(
            name: Routes.PROFILE,
            page: () => ProfileScreen(),
          ),
          GetPage(
            name: Routes.ALARM_CLOCK,
            page: () => AlarmClockScreen(),
          ),
        ])
  };
}
