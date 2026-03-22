// ignore_for_file: public_member_api_docs, sort_constructors_first
class SoundEntity {
  final int volume;
  SoundEntity({
    required this.volume,
  });

  SoundEntity copyWith({
    int? volume,
  }) {
    return SoundEntity(
      volume: volume ?? this.volume,
    );
  }

  @override
  bool operator ==(covariant SoundEntity other) {
    if (identical(this, other)) return true;

    return other.volume == volume;
  }

  @override
  int get hashCode => volume.hashCode;
}
