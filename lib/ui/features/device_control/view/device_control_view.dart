import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp/ui/features/device_control/controller/device_state.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../controller/device_controller.dart';

// ignore: unused_element
const _logTag = "DeviceControlView";

class DeviceControlView extends ConsumerStatefulWidget {
  const DeviceControlView({super.key});

  @override
  ConsumerState<DeviceControlView> createState() => _DeviceControlViewState();
}

class _DeviceControlViewState extends ConsumerState<DeviceControlView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(deviceControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Device Control")),
      body: Center(
        child: state.when(
          data: (data) => _buildBody(data),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text("Error: $e"),
        ),
      ),
    );
  }

  Column _buildBody(DeviceState data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("User: ${data.userName} (${data.role})"),
        Text("Volume: ${data.volume}", style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => ref.read(deviceControllerProvider.notifier).volumeUp(),
          child: const Text("Volume Up"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => ref.read(deviceControllerProvider.notifier).volumeDown(),
          child: const Text("Volume Down"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => ref.read(deviceControllerProvider.notifier).powerOff(),
          child: const Text("Power Off"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => ref.read(themeControllerProvider.notifier).toggle(),
          child: const Text("Toggle Theme"),
        ),
      ],
    );
  }
}
