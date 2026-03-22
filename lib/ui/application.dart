import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp/ui/features/device_control/view/device_control_view.dart';
import 'package:temp/ui/shared/providers/theme/theme_notifier.dart';

class Applicatin extends ConsumerWidget {
  const Applicatin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: 'Device Control',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode == AppThemeMode.light ? ThemeMode.light : ThemeMode.dark,
      home: const DeviceControlView(),
    );
  }
}
