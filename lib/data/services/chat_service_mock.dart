// chat_service_mock

import 'dart:async';

import 'package:app_flutter/data/services/chat_service.dart';

class ChatServiceMock implements ChatService {
  final StreamController<String> _controller = StreamController.broadcast();
  final StreamController<bool> _connController = StreamController.broadcast();
  @override
  bool isConnected = false;
  @override
  Stream<String> get stream => _controller.stream;
  @override
  Stream<bool> get connStream => _connController.stream;

  ChatServiceMock() {
    _connController.add(false);
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        isConnected = true;
        _connController.sink.add(true);
      },
    );
  }

  @override
  bool sendMessage(String msg) {
    if (!isConnected) {
      return false;
    }

    Future.delayed(
      Duration(milliseconds: 100),
      () {
        _controller.sink.add(msg);
      },
    );

    return true;
  }

  @override
  void dispose() {
    _connController.close();
    _controller.close();
  }
}
