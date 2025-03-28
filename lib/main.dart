// main.dart

import 'dart:async';

import 'package:app_flutter/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runZonedGuarded(
    () async {
      await dotenv.load(fileName: "assets/config/.env");

      FlutterError.onError = (FlutterErrorDetails details) {
        debugPrint("error $details");
      };

      runApp(ProviderScope(child: const Application()));
    },
    (error, stack) {
      debugPrint("error $error");
    },
  );
}
