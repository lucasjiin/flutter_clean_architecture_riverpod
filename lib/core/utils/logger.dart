import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:temp/core/constants/environment.dart';

abstract class _Logger {
  void error(String tag, String message, {Object? error, StackTrace? stackTrace});
  void warning(String tag, String message, {Object? error, StackTrace? stackTrace});
  void info(String tag, String message);
  void debug(String tag, String message);
}

final class _LoggerImpl implements _Logger {
  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      noBoxingByDefault: true,
    ),
  );

  @override
  void error(String tag, String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.e('${_formatTime()} [$tag] $message', error: error, stackTrace: stackTrace);

  @override
  void warning(String tag, String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.w('${_formatTime()} [$tag] $message', error: error, stackTrace: stackTrace);

  @override
  void info(String tag, String message) => _logger.i('${_formatTime()} [$tag] $message');

  @override
  void debug(String tag, String message) => _logger.d('${_formatTime()} [$tag] $message');

  String _formatTime() => DateFormat("yyyy-MM-dd HH:mm:ss.SSSS").format(DateTime.now());
}

final class _LoggerWebImpl implements _Logger {
  // Web logger acts as a dummy implementation
  @override
  void error(String tag, String message, {Object? error, StackTrace? stackTrace}) {}

  @override
  void warning(String tag, String message, {Object? error, StackTrace? stackTrace}) {}

  @override
  void info(String tag, String message) {}

  @override
  void debug(String tag, String message) {}
}

final _logger = testMode ? _LoggerWebImpl() : _LoggerImpl();

final class Log {
  static void error(String tag, String message, {Object? error, StackTrace? stackTrace}) {
    _logger.error(tag, message, error: error, stackTrace: stackTrace);
  }

  static void warning(String tag, String message, {Object? error, StackTrace? stackTrace}) {
    _logger.warning(tag, message, error: error, stackTrace: stackTrace);
  }

  static void info(String tag, String message) {
    _logger.info(tag, message);
  }

  static void debug(String tag, String message) {
    _logger.debug(tag, message);
  }
}
