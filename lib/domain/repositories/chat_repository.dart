// websocket_repository.dart

import 'package:app_flutter/data/repositories/chat_repository_impl.dart';
import 'package:app_flutter/data/services/chat_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository.g.dart';

abstract class ChatRepository {
  Stream<String> get stream;
  Stream<bool> get connStream;
  bool get isConnected;
  void sendMessage(String message);
}

@riverpod
ChatRepository chatRepository(Ref ref) {
  final service = ref.watch(chatServiceProvider);

  return ChatRepositoryImpl(service);
}
