// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SoundModel {
  final bool returnValue;
  final int? volume;

  SoundModel({
    this.returnValue = false,
    this.volume,
  });

  SoundModel copyWith({
    bool? returnValue,
    int? volume,
  }) {
    return SoundModel(
      returnValue: returnValue ?? this.returnValue,
      volume: volume ?? this.volume,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'returnValue': returnValue,
      'volume': volume,
    };
  }

  factory SoundModel.fromMap(Map<String, dynamic> map) {
    return SoundModel(
      returnValue: map['returnValue'] as bool,
      volume: map['volume'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SoundModel.fromJson(String source) => SoundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SoundModel(returnValue: $returnValue, volume: $volume)';

  @override
  bool operator ==(covariant SoundModel other) {
    if (identical(this, other)) return true;

    return other.returnValue == returnValue && other.volume == volume;
  }

  @override
  int get hashCode => returnValue.hashCode ^ volume.hashCode;
}
