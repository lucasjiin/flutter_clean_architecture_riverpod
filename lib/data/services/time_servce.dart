// time_servce.dart

import 'dart:async';

import 'package:app_flutter/core/utils/time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_servce.g.dart';

abstract class TimeService {
  String time = '';
  Stream<String> get stream;
  void dispose();
}

class TimeServiceImpl implements TimeService {
  final StreamController<String> _controller = StreamController<String>.broadcast();
  Timer? _timer;
  @override
  String time = Time.now();

  TimeServiceImpl() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time = Time.now();
      _controller.add(time);
    });
  }

  @override
  Stream<String> get stream => _controller.stream;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}

@riverpod
TimeService timeService(Ref ref) {
  final service = TimeServiceImpl();

  ref.onDispose(() => service.dispose());

  return service;
}
