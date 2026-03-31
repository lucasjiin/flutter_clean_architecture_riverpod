import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp/data/repositories/settings_repository_impl.dart';
import 'package:temp/data/repositories/sound_repository_impl.dart';
import 'package:temp/di/datasource_providers.dart';
import 'package:temp/domain/repositories/settings_repository.dart';
import 'package:temp/domain/repositories/sound_repository.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(ref.watch(settingsApiProvider));
});

final soundRepositoryProvider = Provider<SoundRepository>((ref) {
  return SoundRepositoryImpl(ref.watch(soundApiProvider));
});
