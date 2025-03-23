// time_repository.dart

import 'package:app_flutter/data/services/time_servce.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_repository.g.dart';

abstract class TimeRepository {
  String get time;
  Stream<String> get stream;
}

class TimeRepositoryImpl implements TimeRepository {
  final TimeService _service;
  @override
  String get time => _service.time;
  @override
  Stream<String> get stream => _service.stream;

  TimeRepositoryImpl(this._service);
}

@riverpod
TimeRepository timeRepository(Ref ref) {
  final service = ref.watch(timeServiceProvider);

  return TimeRepositoryImpl(service);
}
