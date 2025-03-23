// time_use_caae.dart

import 'package:app_flutter/data/repositories/time_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_use_caae.g.dart';

class TimeUseCaae {
  final TimeRepository _repository;

  TimeUseCaae(this._repository);

  String get time => _repository.time;

  Stream<String> get stream => _repository.stream;
}

@riverpod
TimeUseCaae timeUsecase(Ref ref) {
  final repository = ref.watch(timeRepositoryProvider);

  return TimeUseCaae(repository);
}
