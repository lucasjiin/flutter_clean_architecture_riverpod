import '../../domain/entities/sound_entity.dart';
import '../../domain/repositories/sound_repository.dart';
import '../datasources/sound_api.dart';

class SoundRepositoryImpl implements SoundRepository {
  final SoundApi _api;
  SoundRepositoryImpl(this._api);

  @override
  Stream<SoundEntity> watch() => _api.subscribe().map((m) => SoundEntity(volume: m.volume));

  @override
  Future<SoundEntity> fetch() async {
    final m = await _api.fetch();
    return SoundEntity(volume: m.volume);
  }

  @override
  Future<void> setVolume(int vol) => _api.setVolume(vol);
}
