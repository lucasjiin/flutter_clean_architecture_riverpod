// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:temp/domain/entities/settings_entity.dart';
import 'package:temp/domain/entities/sound_entity.dart';

class DeviceState {
  final SettingsEntity settings;
  final SoundEntity sound;
  DeviceState({
    required this.settings,
    required this.sound,
  });

  DeviceState copyWith({
    SettingsEntity? settings,
    SoundEntity? sound,
  }) {
    return DeviceState(
      settings: settings ?? this.settings,
      sound: sound ?? this.sound,
    );
  }

  @override
  String toString() => 'DeviceState(settings: $settings, sound: $sound)';

  @override
  bool operator ==(covariant DeviceState other) {
    if (identical(this, other)) return true;

    return other.settings == settings && other.sound == sound;
  }

  @override
  int get hashCode => settings.hashCode ^ sound.hashCode;
}
