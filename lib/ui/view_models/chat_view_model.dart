// home_view_model.dart

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

    final subscription = stream.listen(
      (message) {
        debugPrint("receiveMessage $message");
        state = state.copyWith(
          incomingMessage: message,
          history: [...state.history, Message(type: MessageType.incoming, data: message)],
        );
      },
      onDone: () {
        debugPrint("finished stream");
      },
      onError: (error) {
        debugPrint("error stream: ${error.toString()}");
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
      onDone: () {
        debugPrint("finished connection stream");
      },
      onError: (error) {
        debugPrint("error connection stream: ${error.toString()}");
      },
      cancelOnError: true,
    );

    ref.onDispose(() {
      connectionSubscription.cancel();
      subscription.cancel();
    });

    return ChatState(isConnected: chatUseCaae.isConnected);
  }

  sendMessage(String message) {
    final result = ref.read(chatUseCaaeProvider).sendMessage(message);
    if (result) {
      state = state.copyWith(
        incomingMessage: message,
        history: [...state.history, Message(type: MessageType.outgoing, data: message)],
      );
    }
  }
}
