import 'package:temp/data/datasources/settings_api.dart';
import 'package:temp/domain/repositories/settings_repository.dart';

import '../../domain/entities/settings_entity.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsApi _api;
  SettingsRepositoryImpl(this._api);

  @override
  Stream<SettingsEntity> watch() => _api.subscribe().map((m) => SettingsEntity(userName: m.userName, role: m.role));

  @override
  Future<SettingsEntity> fetch() async {
    final m = await _api.getSettings();
    return SettingsEntity(userName: m.userName, role: m.role);
  }
}
