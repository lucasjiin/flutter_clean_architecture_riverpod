import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp/data/datasources/sound_api.dart';
import 'package:temp/data/repositories/sound_repository_impl.dart';

import '../entities/sound_entity.dart';

abstract class SoundRepository {
  Stream<SoundEntity> watch();
  Future<SoundEntity> fetch();
  Future<void> setVolume(int vol);
}

final soundRepositoryProvider = Provider<SoundRepository>((ref) {
  return SoundRepositoryImpl(ref.watch(soundApiProvider));
});

final soundStreamProvider = StreamProvider<SoundEntity>((ref) {
  return ref.watch(soundRepositoryProvider).watch();
});
