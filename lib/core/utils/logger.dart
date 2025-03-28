// logger.dart

import 'package:logger/logger.dart' as log;
import 'package:logger/web.dart';

final class Logger {
  static final _logger = log.Logger(printer: PrettyPrinter(methodCount: 0, noBoxingByDefault: true));

  static void error(String tag, String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e('[$tag] $message', time: DateTime.now(), error: error, stackTrace: stackTrace);
  }

  static void warning(String tag, String message, {Object? error, StackTrace? stackTrace}) {
    _logger.w('[$tag] $message', time: DateTime.now(), error: error, stackTrace: stackTrace);
  }

  static void info(String tag, String message) {
    _logger.i('[$tag] $message', time: DateTime.now());
  }

  static void debug(String tag, String message) {
    _logger.d('[$tag] $message', time: DateTime.now());
  }
}
