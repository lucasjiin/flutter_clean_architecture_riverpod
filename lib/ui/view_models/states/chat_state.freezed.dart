// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatState {
  String get incomingMessage;
  List<Message> get history;
  bool get isConnected;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatStateCopyWith<ChatState> get copyWith =>
      _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatState &&
            (identical(other.incomingMessage, incomingMessage) ||
                other.incomingMessage == incomingMessage) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incomingMessage,
      const DeepCollectionEquality().hash(history), isConnected);

  @override
  String toString() {
    return 'ChatState(incomingMessage: $incomingMessage, history: $history, isConnected: $isConnected)';
  }
}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) =
      _$ChatStateCopyWithImpl;
  @useResult
  $Res call({String incomingMessage, List<Message> history, bool isConnected});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomingMessage = null,
    Object? history = null,
    Object? isConnected = null,
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
    ));
  }
}

/// @nodoc

class _ChatState implements ChatState {
  _ChatState(
      {this.incomingMessage = '',
      final List<Message> history = const [],
      this.isConnected = false})
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

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            (identical(other.incomingMessage, incomingMessage) ||
                other.incomingMessage == incomingMessage) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incomingMessage,
      const DeepCollectionEquality().hash(_history), isConnected);

  @override
  String toString() {
    return 'ChatState(incomingMessage: $incomingMessage, history: $history, isConnected: $isConnected)';
  }
}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) _then) =
      __$ChatStateCopyWithImpl;
  @override
  @useResult
  $Res call({String incomingMessage, List<Message> history, bool isConnected});
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incomingMessage = null,
    Object? history = null,
    Object? isConnected = null,
  }) {
    return _then(_ChatState(
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
    ));
  }
}

// dart format on
