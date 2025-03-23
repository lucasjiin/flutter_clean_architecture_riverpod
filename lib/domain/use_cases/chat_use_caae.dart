// chat_use_caae.dart

import 'package:app_flutter/data/repositories/chat_repository_impl.dart';
import 'package:app_flutter/domain/repositories/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_use_caae.g.dart';

class ChatUseCaae {
  final ChatRepository _repository;

  ChatUseCaae(this._repository);

  Stream<String> get stream => _repository.stream;

  Stream<bool> get connStream => _repository.connStream;

  bool get isConnected => _repository.isConnected;

  List<Message> get history => _repository.history;

  bool sendMessage(String message) => _repository.sendMessage(message);
}

@riverpod
ChatUseCaae chatUseCaae(Ref ref) {
  final repository = ref.watch(chatRepositoryProvider);

  return ChatUseCaae(repository);
}
