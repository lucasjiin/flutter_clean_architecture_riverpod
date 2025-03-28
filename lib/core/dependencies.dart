// dependencies.dart

import 'package:app_flutter/data/repositories/chat_repository_impl.dart';
import 'package:app_flutter/data/repositories/time_repository_impl.dart';
import 'package:app_flutter/data/services/chat_service.dart';
import 'package:app_flutter/data/services/chat_service_mock.dart';
import 'package:app_flutter/data/services/time_servce.dart';
import 'package:app_flutter/domain/repositories/chat_repository.dart';
import 'package:app_flutter/domain/repositories/time_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dependencies.g.dart';

@riverpod
ChatService chatService(Ref ref) {
  // final service = ChatServiceImpl();
  final service = ChatServiceMock();

  ref.onDispose(() {
    service.dispose();
  });

  return service;
}

@riverpod
ChatRepository chatRepository(Ref ref) {
  final repository = ChatRepositoryImpl(ref.watch(chatServiceProvider));

  ref.onDispose(() {
    repository.dispose();
  });

  return repository;
}

@riverpod
TimeService timeService(Ref ref) {
  final service = TimeServiceImpl();

  ref.onDispose(() => service.dispose());

  return service;
}

@riverpod
TimeRepository timeRepository(Ref ref) {
  final repository = TimeRepositoryImpl(ref.watch(timeServiceProvider));

  ref.onDispose(() {
    repository.dispose();
  });

  return repository;
}
