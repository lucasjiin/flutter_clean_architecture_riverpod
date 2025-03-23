// chat_view_model.dart

import 'dart:async';

import 'package:app_flutter/domain/use_cases/chat_use_caae.dart';
import 'package:app_flutter/ui/view_models/states/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.g.dart';

@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  ChatState build() {
    final chatUseCaae = ref.watch(chatUseCaaeProvider);
    final stream = chatUseCaae.stream;
    final connStream = chatUseCaae.connStream;
    final history = chatUseCaae.history;

    final subscription = stream.listen(
      (message) {
        state = state.copyWith(
          incomingMessage: message,
          history: history,
        );
      },
      cancelOnError: true,
    );

    StreamSubscription<bool> connectionSubscription = connStream.listen(
      (isConnected) {
        debugPrint("isConnected $isConnected");
        state = state.copyWith(
          isConnected: isConnected,
        );
      },
      cancelOnError: true,
    );

    ref.onDispose(() {
      connectionSubscription.cancel();
      subscription.cancel();
    });

    return ChatState(isConnected: chatUseCaae.isConnected);
  }

  bool sendMessage(String message) {
    final result = ref.read(chatUseCaaeProvider).sendMessage(message);
    final history = ref.read(chatUseCaaeProvider).history;
    if (result) {
      state = state.copyWith(
        history: history,
      );
    }
    return result;
  }
}
