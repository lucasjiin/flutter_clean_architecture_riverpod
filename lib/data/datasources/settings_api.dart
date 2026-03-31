import 'dart:async';

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

  StreamController<SettingsModel>? _bridge;
  StreamSubscription? _subscription;
  BehaviorSubject<SettingsModel>? _subject;

  @override
  Stream<SettingsModel> subscribe() {
    _bridge ??= StreamController<SettingsModel>();
    _subject ??= BehaviorSubject<SettingsModel>();
    _subscription ??= _bridge!.stream.listen(
      (event) {
        _subject!.add(event);
      },
      onError: (error) {
        _subject!.addError(error);
      },
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _bridge!.add(SettingsModel(returnValue: true, userName: "Admin", role: "admin"));
    });

    return _subject!.stream;
  }

  @override
  Future<SettingsModel> getSettings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return SettingsModel(returnValue: true, userName: "Admin", role: "admin");
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _bridge?.close();
    _subject?.close();
  }
}
