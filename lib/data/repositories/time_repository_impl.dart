// time_repository_impl.dart

import 'package:app_flutter/data/services/time_servce.dart';
import 'package:app_flutter/domain/repositories/time_repository.dart';

class TimeRepositoryImpl implements TimeRepository {
  final TimeService _service;
  @override
  String get time => _service.time;
  @override
  Stream<String> get stream => _service.stream;

  TimeRepositoryImpl(this._service);

  @override
  void dispose() {}
}
