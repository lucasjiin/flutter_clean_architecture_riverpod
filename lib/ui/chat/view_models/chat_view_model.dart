// home_view_model.dart

import 'package:app_flutter/core/dependencies.dart';
import 'package:app_flutter/core/utils/logger.dart';
import 'package:app_flutter/core/utils/time.dart';
import 'package:app_flutter/data/repositories/chat_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.freezed.dart';
part 'chat_view_model.g.dart';

@freezed
abstract class ChatViewState with _$ChatViewState {
  factory ChatViewState({
    @Default('') String incomingMessage,
    @Default([]) List<Message> history,
    @Default(false) bool isConnected,
    @Default('') String time,
  }) = _HomeState;
}

@riverpod
class ChatViewModel extends _$ChatViewModel {
  final _logTag = "ChatViewModel";

  @override
  ChatViewState build() {
    final chatRepository = ref.watch(chatRepositoryProvider);
    final chatStream = chatRepository.stream;
    final chatConnStream = chatRepository.connStream;
    final chatHistory = chatRepository.history;

    final timeRepository = ref.watch(timeRepositoryProvider);
    final timeStream = timeRepository.stream;

    final timeSubscription = timeStream.listen((String time) {
      state = state.copyWith(time: time);
    }, cancelOnError: true);

    final chatSubscription = chatStream.listen(
      (message) {
        state = state.copyWith(
          incomingMessage: message,
          history: [...chatHistory],
        );
      },
      cancelOnError: true,
    );

    final connectionSubscription = chatConnStream.listen(
      (isConnected) {
        Logger.info(_logTag, "isConnected");
        state = state.copyWith(
          isConnected: isConnected,
        );
      },
      cancelOnError: true,
    );

    ref.onDispose(() {
      timeSubscription.cancel();
      connectionSubscription.cancel();
      chatSubscription.cancel();
    });
    return ChatViewState(isConnected: chatRepository.isConnected, time: Time.now());
  }

  bool sendMessage(String message) {
    final result = ref.read(chatRepositoryProvider).sendMessage(message);
    final history = ref.read(chatRepositoryProvider).history;
    if (result) {
      state = state.copyWith(
        history: [...history],
      );
    }
    return result;
  }
}
