import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SettingsEntity {
  final String? userName;
  final String? role;
  
  SettingsEntity({
    this.userName,
    this.role,
  });

  SettingsEntity copyWith({
    String? userName,
    String? role,
  }) {
    return SettingsEntity(
      userName: userName ?? this.userName,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'role': role,
    };
  }

  factory SettingsEntity.fromMap(Map<String, dynamic> map) {
    return SettingsEntity(
      userName: map['userName'] != null ? map['userName'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsEntity.fromJson(String source) => SettingsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SettingsEntity(userName: $userName, role: $role)';

  @override
  bool operator ==(covariant SettingsEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.userName == userName &&
      other.role == role;
  }

  @override
  int get hashCode => userName.hashCode ^ role.hashCode;
}
