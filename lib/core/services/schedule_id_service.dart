import 'dart:math';

class ScheduleId {
  get() {
    int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

    Random random = Random(currentTimeMillis);

    int randomInt = random.nextInt(10000);
    return randomInt;
  }
}
