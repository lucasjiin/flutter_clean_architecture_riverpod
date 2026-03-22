import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:temp/ui/application.dart';

const testMode = bool.fromEnvironment('IS_TEST');

const List<Override> providerOverrides = [];

void main() {
  runApp(
    const ProviderScope(
      overrides: testMode ? providerOverrides : [],
      child: Applicatin(),
    ),
  );
}
