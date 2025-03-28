// websocket_repository.dart

import 'package:app_flutter/data/repositories/chat_repository_impl.dart';

abstract class ChatRepository {
  List<Message> history = [];
  Stream<String> get stream;
  Stream<bool> get connStream;
  bool get isConnected;
  bool sendMessage(String message);
  void dispose();
}
