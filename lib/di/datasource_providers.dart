import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp/data/datasources/settings_api.dart';
import 'package:temp/data/datasources/sound_api.dart';

final settingsApiProvider = Provider((ref) {
  final api = SettingsApiImpl();

  ref.onDispose(() => api.dispose());

  return api;
});

final soundApiProvider = Provider((ref) {
  final api = SoundApiImpl();

  ref.onDispose(() => api.dispose());

  return api;
});
