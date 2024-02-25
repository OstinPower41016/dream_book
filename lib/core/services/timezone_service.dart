import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimeZone {
  void init() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("Europe/Moscow"));
  }
}
