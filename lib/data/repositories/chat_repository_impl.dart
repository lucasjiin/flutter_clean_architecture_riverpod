// chat_repository_impl.dart

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
  @override
  Stream<String> get stream => _service.stream;
  @override
  Stream<bool> get connStream => _service.connStream;
  @override
  bool get isConnected => _service.isConnected;

  ChatRepositoryImpl(this._service) {
    _subscription = _service.stream.listen(
      (message) {
        _addHistory(MessageType.incoming, message);
      },
      cancelOnError: true,
    );
  }

  @override
  bool sendMessage(String message) {
    final result = _service.sendMessage(message);
    if (result) {
      _addHistory(MessageType.outgoing, message);
    }

    return result;
  }

  void _addHistory(MessageType type, String message) {
    if (history.length > 100) {
      history.removeAt(0);
    }
    history.add(Message(type: type, data: message));
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
