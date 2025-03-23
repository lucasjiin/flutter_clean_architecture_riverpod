// time.dart

import 'package:intl/intl.dart';

final class Time {
  static String now() => DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
}
