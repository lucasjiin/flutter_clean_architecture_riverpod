// time_servce.dart

import 'dart:async';

import 'package:app_flutter/core/utils/time.dart';

abstract class TimeService {
  String time = '';
  Stream<String> get stream;
  void dispose();
}

class TimeServiceImpl implements TimeService {
  final StreamController<String> _controller = StreamController<String>.broadcast();
  Timer? _timer;
  @override
  Stream<String> get stream => _controller.stream;
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
  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
