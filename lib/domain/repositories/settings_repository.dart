import '../entities/settings_entity.dart';

abstract class SettingsRepository {
  Stream<SettingsEntity> watch();
  Future<SettingsEntity> fetch();
}
