import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../models/settings_model.dart';

abstract class SettingsApi {
  Stream<SettingsModel> subscribe();
  Future<SettingsModel> getSettings();
  void dispose();
}

class SettingsApiImpl extends SettingsApi {
  static const baseUrl = "";
  static const settingsGetPath = "";
  static const settingsSetPath = "";

  final _bridge = StreamController();
  final _subject = BehaviorSubject<SettingsModel>();

  SettingsApiImpl() {
    // bridge.stream.listen(
    //   (event) {
    // _subject.add(SettingsModel(returnValue: true, userName: "Admin", role: "admin"));
    //   },
    //   onError: (error) {
    //     _subject.addError(error);
    //   },
    // );

    Future.delayed(const Duration(milliseconds: 500), () {
      _subject.add(SettingsModel(returnValue: true, userName: "Admin", role: "admin"));
    });
  }

  @override
  Stream<SettingsModel> subscribe() => _subject.stream;

  @override
  Future<SettingsModel> getSettings() async => _subject.value;

  @override
  void dispose() {
    _bridge.close();
    _subject.close();
  }
}

final settingsApiProvider = Provider((ref) {
  ref.onDispose(() => SettingsApiImpl().dispose());

  return SettingsApiImpl();
});
