// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatViewState {
  String get incomingMessage;
  List<Message> get history;
  bool get isConnected;
  String get time;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<ChatViewState> get copyWith =>
      _$HomeStateCopyWithImpl<ChatViewState>(this as ChatViewState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatViewState &&
            (identical(other.incomingMessage, incomingMessage) ||
                other.incomingMessage == incomingMessage) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incomingMessage,
      const DeepCollectionEquality().hash(history), isConnected, time);

  @override
  String toString() {
    return 'HomeState(incomingMessage: $incomingMessage, history: $history, isConnected: $isConnected, time: $time)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(ChatViewState value, $Res Function(ChatViewState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {String incomingMessage,
      List<Message> history,
      bool isConnected,
      String time});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final ChatViewState _self;
  final $Res Function(ChatViewState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomingMessage = null,
    Object? history = null,
    Object? isConnected = null,
    Object? time = null,
  }) {
    return _then(_self.copyWith(
      incomingMessage: null == incomingMessage
          ? _self.incomingMessage
          : incomingMessage // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _HomeState implements ChatViewState {
  _HomeState(
      {this.incomingMessage = '',
      final List<Message> history = const [],
      this.isConnected = false,
      this.time = ''})
      : _history = history;

  @override
  @JsonKey()
  final String incomingMessage;
  final List<Message> _history;
  @override
  @JsonKey()
  List<Message> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final String time;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            (identical(other.incomingMessage, incomingMessage) ||
                other.incomingMessage == incomingMessage) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incomingMessage,
      const DeepCollectionEquality().hash(_history), isConnected, time);

  @override
  String toString() {
    return 'HomeState(incomingMessage: $incomingMessage, history: $history, isConnected: $isConnected, time: $time)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String incomingMessage,
      List<Message> history,
      bool isConnected,
      String time});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incomingMessage = null,
    Object? history = null,
    Object? isConnected = null,
    Object? time = null,
  }) {
    return _then(_HomeState(
      incomingMessage: null == incomingMessage
          ? _self.incomingMessage
          : incomingMessage // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
