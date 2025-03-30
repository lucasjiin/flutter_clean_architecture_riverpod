// configs.dart

import 'dart:io';

import 'package:app_flutter/core/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, test, prod }

final _logTag = 'configs';

bool get isDev => dotenv.env['ENV'] == Environment.dev.name;
bool get isTest {
  bool retVal = dotenv.env["ENV"] == Environment.test.name;
  if (!kIsWeb && Platform.environment.containsKey('FLUTTER_TEST')) {
    retVal = true;
    logger.debug(_logTag, 'FLUTTER_TEST ${Platform.environment.containsKey('FLUTTER_TEST')}');
  }

  return retVal;
}

String getMode() {
  if (isDev) {
    return Environment.dev.name;
  } else if (isTest) {
    return Environment.test.name;
  } else if (isProd) {
    return Environment.prod.name;
  }

  return 'unknown';
}

bool get isProd => !isDev && !isTest;
