import '../entities/sound_entity.dart';

abstract class SoundRepository {
  Stream<SoundEntity> watch();
  Future<SoundEntity> fetch();
  Future<void> setVolume(int vol);
}
