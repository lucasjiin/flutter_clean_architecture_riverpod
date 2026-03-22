import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../models/sound_model.dart';

abstract class SoundApi {
  Stream<SoundModel> subscribe();
  Future<SoundModel> fetch();
  Future<void> setVolume(int vol);
  void dispose();
}

class SoundApiImpl extends SoundApi {
  static const baseUrl = "";
  static const volumeGetPath = "";
  static const volumeSetPath = "";

  final _bridge = StreamController();
  final BehaviorSubject<SoundModel> _subject = BehaviorSubject<SoundModel>();

  SoundApiImpl() {
    // bridge.stream.listen(
    //   (event) {
    //     _subject.add(SoundModel(returnValue: true, volume: 10));
    //   },
    //   onError: (error) {
    //     _subject.addError(error);
    //   },
    // );

    Future.delayed(const Duration(milliseconds: 1000), () {
      _subject.add(SoundModel(returnValue: true, volume: 10));
    });
  }

  @override
  Stream<SoundModel> subscribe() => _subject.stream;

  @override
  Future<SoundModel> fetch() async => _subject.value;

  @override
  Future<void> setVolume(int vol) async {
    _subject.add(SoundModel(returnValue: true, volume: vol));
  }

  @override
  void dispose() {
    _subject.close();
    _bridge.close();
  }
}

final soundApiProvider = Provider((ref) {
  ref.onDispose(() => SoundApiImpl().dispose());

  return SoundApiImpl();
});
