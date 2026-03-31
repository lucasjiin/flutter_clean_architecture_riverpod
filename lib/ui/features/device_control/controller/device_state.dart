// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeviceState {
  final String userName;
  final String role;
  final int volume;

  DeviceState({
    this.userName = "",
    this.role = "",
    this.volume = 0,
  });

  DeviceState copyWith({
    String? userName,
    String? role,
    int? volume,
  }) {
    return DeviceState(
      userName: userName ?? this.userName,
      role: role ?? this.role,
      volume: volume ?? this.volume,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'role': role,
      'volume': volume,
    };
  }

  factory DeviceState.fromMap(Map<String, dynamic> map) {
    return DeviceState(
      userName: map['userName'] as String,
      role: map['role'] as String,
      volume: map['volume'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceState.fromJson(String source) => DeviceState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeviceState(userName: $userName, role: $role, volume: $volume)';

  @override
  bool operator ==(covariant DeviceState other) {
    if (identical(this, other)) return true;

    return other.userName == userName && other.role == role && other.volume == volume;
  }

  @override
  int get hashCode => userName.hashCode ^ role.hashCode ^ volume.hashCode;
}
