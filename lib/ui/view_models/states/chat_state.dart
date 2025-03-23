// chat_state.dart

import 'package:app_flutter/data/repositories/chat_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  factory ChatState({
    @Default('') String incomingMessage,
    @Default([]) List<Message> history,
    @Default(false) bool isConnected,
  }) = _ChatState;
}
