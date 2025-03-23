// chat_repository.dart

import 'dart:async';

import 'package:app_flutter/data/services/chat_service.dart';
import 'package:app_flutter/domain/repositories/chat_repository.dart';

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

class ChatRepositoryImpl implements ChatRepository {
  final ChatService _service;
  StreamSubscription<String>? _subscription;
  @override
  List<Message> history = [];

  ChatRepositoryImpl(this._service) {
    _subscription = _service.stream.listen(
      (message) {
        history.add(Message(type: MessageType.incoming, data: message));
      },
      cancelOnError: true,
    );
  }

  @override
  Stream<String> get stream => _service.stream;

  @override
  Stream<bool> get connStream => _service.connStream;

  @override
  bool get isConnected => _service.isConnected;

  @override
  bool sendMessage(String message) {
    final result = _service.sendMessage(message);
    if (result) {
      history.add(Message(type: MessageType.outgoing, data: message));
    }

    return result;
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
