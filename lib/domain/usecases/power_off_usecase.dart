import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp/di/repository_providers.dart';
import 'package:temp/domain/repositories/settings_repository.dart';

final powerOffUseCaseProvider = Provider((ref) {
  return PowerOffUseCase(ref.watch(settingsRepositoryProvider));
});

class PowerOffUseCase {
  final SettingsRepository _settingsRepo;
  PowerOffUseCase(this._settingsRepo);

  Future<bool> execute() async {
    final settings = await _settingsRepo.fetch();
    if (settings.role == 'admin') {
      return true;
    }
    return false;
  }
}
