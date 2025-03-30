// time.dart

import 'package:intl/intl.dart';

final class Time {
  static String format({DateTime? time, bool hasMicroseconds = false}) {
    return DateFormat("yyyy-MM-dd HH:mm:ss${hasMicroseconds ? ".SSSS" : ""}").format(time ?? DateTime.now());
  }
}
