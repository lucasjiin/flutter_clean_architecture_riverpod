// chat_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  factory ChatState({
    @Default('') String incomingMessage,
    @Default([]) List<String> history,
    @Default(false) bool isConnected,
  }) = _ChatState;
}
