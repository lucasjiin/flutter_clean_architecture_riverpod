import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:temp/domain/entities/settings_entity.dart';
import 'package:temp/domain/entities/sound_entity.dart';
import 'package:temp/domain/repositories/settings_repository.dart';
import 'package:temp/domain/repositories/sound_repository.dart';
import 'package:temp/domain/usecases/power_off_usecase.dart';

import 'device_state.dart';

class DeviceController extends AsyncNotifier<DeviceState> {
  @override
  FutureOr<DeviceState> build() async {
    // final settingsStream = ref.watch(watchSettingsProvider.future).asStream();
    final settingsStream = ref.watch(settingsStreamProvider.future).asStream();
    final soundStream = ref.watch(soundStreamProvider.future).asStream();

    return CombineLatestStream.combine2<SettingsEntity, SoundEntity, DeviceState>(
      settingsStream,
      soundStream,
      (s, so) => DeviceState(settings: s, sound: so),
    ).first;
  }

  Future<void> volumeUp() async {
    final current = state.value!.sound.volume;
    await ref.read(soundRepositoryProvider).setVolume(current + 5);
  }

  Future<void> volumeDown() async {
    final current = state.value!.sound.volume;
    await ref.read(soundRepositoryProvider).setVolume(current - 5);
  }

  Future<void> powerOff() async {
    await ref.read(powerOffUseCaseProvider).execute();
  }
}

final deviceControllerProvider = AsyncNotifierProvider<DeviceController, DeviceState>(() => DeviceController());
