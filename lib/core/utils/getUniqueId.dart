import 'dart:math';

int getUniqueId() {
  return DateTime.now().millisecondsSinceEpoch % (pow(2, 31).toInt());
}
