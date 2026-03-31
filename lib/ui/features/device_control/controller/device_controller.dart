import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:temp/core/utils/logger.dart';
import 'package:temp/di/repository_providers.dart';
import 'package:temp/domain/entities/settings_entity.dart';
import 'package:temp/domain/entities/sound_entity.dart';
import 'package:temp/domain/usecases/power_off_usecase.dart';

import 'device_state.dart';

const _logTag = "DeviceController";

class DeviceController extends AsyncNotifier<DeviceState> {
  StreamSubscription<(SettingsEntity, SoundEntity)>? _subscription;

  @override
  FutureOr<DeviceState> build() async {
    Log.info(_logTag, "build() called");

    final settingsStream = ref.watch(settingsRepositoryProvider).watch();
    final soundStream = ref.watch(soundRepositoryProvider).watch();

    final combinedStream = CombineLatestStream.combine2<SettingsEntity, SoundEntity, (SettingsEntity, SoundEntity)>(
      settingsStream,
      soundStream,
      (settings, sound) {
        return (settings, sound);
      },
    );

    final completer = Completer<DeviceState>();

    _subscription?.cancel();
    _subscription = combinedStream.listen(
      (data) {
        final (settings, sound) = data;
        if (!completer.isCompleted) {
          completer.complete(DeviceState(
            role: settings.role ?? "",
            userName: settings.userName ?? "",
            volume: sound.volume ?? 0,
          ));
        } else {
          _onDataChanged(data);
        }
      },
      onError: (e, st) => state = AsyncError(e, st),
    );

    ref.onDispose(() => _subscription?.cancel());

    return completer.future;
  }

  void _onDataChanged((SettingsEntity, SoundEntity) data) {
    Log.info(_logTag, "data changed $data");
    final current = state.value!;
    final (settings, sound) = data;
    state = AsyncData(current.copyWith(
      userName: settings.userName,
      role: settings.role,
      volume: sound.volume,
    ));
  }

  Future<void> volumeUp() async {
    if (state.value == null) return;

    final current = state.value!.volume;
    await ref.read(soundRepositoryProvider).setVolume(current + 5);
  }

  Future<void> volumeDown() async {
    if (state.value == null) return;

    final current = state.value!.volume;
    await ref.read(soundRepositoryProvider).setVolume(current - 5);
  }

  Future<void> powerOff() async {
    await ref.read(powerOffUseCaseProvider).execute();
  }
}

final deviceControllerProvider = AsyncNotifierProvider<DeviceController, DeviceState>(() => DeviceController());
