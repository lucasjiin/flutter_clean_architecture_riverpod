// logger.dart

import 'package:app_flutter/core/utils/time.dart';
import 'package:logger/logger.dart' as log;
import 'package:logger/web.dart';

abstract class Logger {
  void error(String tag, String message, {Object? error, StackTrace? stackTrace});
  void warning(String tag, String message, {Object? error, StackTrace? stackTrace});
  void info(String tag, String message);
  void debug(String tag, String message);
}

final logTag = 'Logger';

final class LoggerImpl extends Logger {
  final _logger = log.Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      noBoxingByDefault: true,
    ),
  );

  @override
  void error(String tag, String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e('${Time.format(hasMicroseconds: true)} [$tag] $message',
        time: DateTime.now(), error: error, stackTrace: stackTrace);
  }

  @override
  void warning(String tag, String message, {Object? error, StackTrace? stackTrace}) {
    _logger.w('${Time.format(hasMicroseconds: true)} [$tag] $message',
        time: DateTime.now(), error: error, stackTrace: stackTrace);
  }

  @override
  void info(String tag, String message) {
    _logger.i('${Time.format(hasMicroseconds: true)} [$tag] $message', time: DateTime.now());
  }

  @override
  void debug(String tag, String message) {
    _logger.d('${Time.format(hasMicroseconds: true)} [$tag] $message', time: DateTime.now());
  }
}
