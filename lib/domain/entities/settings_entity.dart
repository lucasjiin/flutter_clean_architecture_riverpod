// ignore_for_file: public_member_api_docs, sort_constructors_first
class SettingsEntity {
  final String userName;
  final String role;
  SettingsEntity({
    required this.userName,
    required this.role,
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

  @override
  bool operator ==(covariant SettingsEntity other) {
    if (identical(this, other)) return true;

    return other.userName == userName && other.role == role;
  }

  @override
  int get hashCode => userName.hashCode ^ role.hashCode;
}
