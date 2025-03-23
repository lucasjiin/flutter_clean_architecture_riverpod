// chat_repository.dart

import 'package:app_flutter/data/services/chat_service.dart';
import 'package:app_flutter/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatService _service;
  @override
  Stream<String> get stream => _service.stream;
  @override
  Stream<bool> get connStream => _service.connStream;
  @override
  bool get isConnected => _service.isConnected;

  ChatRepositoryImpl(this._service);

  @override
  void sendMessage(String message) {
    _service.sendMessage(message);
  }
}
