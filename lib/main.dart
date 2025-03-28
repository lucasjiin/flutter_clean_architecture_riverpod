// main.dart

import 'dart:async';

import 'package:app_flutter/application.dart';
import 'package:app_flutter/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _logTag = 'main';

void main() {
  runZonedGuarded(
    () async {
      await dotenv.load(fileName: "assets/config/.env");

      FlutterError.onError = (FlutterErrorDetails details) {
        Logger.error(_logTag, '$details');
      };

      runApp(ProviderScope(child: const Application()));
    },
    (error, stack) {
      Logger.error(_logTag, '$error', stackTrace: stack);
    },
  );
}
