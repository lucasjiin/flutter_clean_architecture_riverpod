import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SoundEntity {
  final int? volume;

  SoundEntity({
    this.volume,
  });

  SoundEntity copyWith({
    int? volume,
  }) {
    return SoundEntity(
      volume: volume ?? this.volume,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'volume': volume,
    };
  }

  factory SoundEntity.fromMap(Map<String, dynamic> map) {
    return SoundEntity(
      volume: map['volume'] != null ? map['volume'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SoundEntity.fromJson(String source) => SoundEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SoundEntity(volume: $volume)';

  @override
  bool operator ==(covariant SoundEntity other) {
    if (identical(this, other)) return true;

    return other.volume == volume;
  }

  @override
  int get hashCode => volume.hashCode;
}
