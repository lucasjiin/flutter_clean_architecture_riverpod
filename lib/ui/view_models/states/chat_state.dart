// chat_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

enum MessageType {
  incoming,
  outgoing,
}

class Message {
  MessageType type;
  String data;

  Message({
    required this.type,
    required this.data,
  });
}

@freezed
abstract class ChatState with _$ChatState {
  factory ChatState({
    @Default('') String incomingMessage,
    @Default([]) List<Message> history,
    @Default(false) bool isConnected,
  }) = _ChatState;
}
