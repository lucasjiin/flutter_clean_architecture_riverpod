// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SettingsModel {
  final bool returnValue;
  final String? userName;
  final String? role;

  SettingsModel({
    this.returnValue = false,
    this.userName,
    this.role,
  });

  SettingsModel copyWith({
    bool? returnValue,
    String? userName,
    String? role,
  }) {
    return SettingsModel(
      returnValue: returnValue ?? this.returnValue,
      userName: userName ?? this.userName,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'returnValue': returnValue,
      'userName': userName,
      'role': role,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      returnValue: map['returnValue'] as bool,
      userName: map['userName'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) => SettingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SettingsModel(returnValue: $returnValue, userName: $userName, role: $role)';

  @override
  bool operator ==(covariant SettingsModel other) {
    if (identical(this, other)) return true;

    return other.returnValue == returnValue && other.userName == userName && other.role == role;
  }

  @override
  int get hashCode => returnValue.hashCode ^ userName.hashCode ^ role.hashCode;
}
