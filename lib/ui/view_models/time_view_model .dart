// home_view_model.dart

import 'package:app_flutter/domain/use_cases/time_use_caae.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_view_model .g.dart';

@riverpod
class TimeViewModel extends _$TimeViewModel {
  @override
  String build() {
    final stream = ref.watch(timeUsecaseProvider).stream;

    final subscription = stream.listen((time) {
      state = time;
    }, onDone: () {
      debugPrint("finished time service");
      state = "finished time service";
    }, onError: (error) {
      debugPrint("timer error: ${error.toString()}");
      state = "errro time service: ${error.toString()}";
    }, cancelOnError: true);

    ref.onDispose(() {
      subscription.cancel();
    });

    return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  }
}
