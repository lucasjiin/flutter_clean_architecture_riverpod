import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/theme/theme_notifier.dart';
import '../controller/device_controller.dart';

class DeviceControlView extends ConsumerWidget {
  const DeviceControlView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Device Control")),
      body: Center(
        child: state.when(
          data: (data) {
            print(data.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User: ${data.settings.userName} (${data.settings.role})"),
                Text("Volume: ${data.sound.volume}", style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => ref.read(deviceControllerProvider.notifier).volumeUp(),
                  child: const Text("Volume Up"),
                ),
                ElevatedButton(
                  onPressed: () => ref.read(deviceControllerProvider.notifier).volumeDown(),
                  child: const Text("Volume Down"),
                ),
                ElevatedButton(
                  onPressed: () => ref.read(deviceControllerProvider.notifier).powerOff(),
                  child: const Text("Power Off"),
                ),
                ElevatedButton(
                  onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
                  child: const Text("Toggle Theme"),
                ),
              ],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text("Error: $e"),
        ),
      ),
    );
  }
}
