import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp/data/datasources/settings_api.dart';
import 'package:temp/data/repositories/settings_repository_impl.dart';

import '../entities/settings_entity.dart';

abstract class SettingsRepository {
  Stream<SettingsEntity> watch();
  Future<SettingsEntity> fetch();
}

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(ref.watch(settingsApiProvider));
});

final settingsStreamProvider = StreamProvider<SettingsEntity>((ref) {
  return ref.watch(settingsRepositoryProvider).watch();
});
