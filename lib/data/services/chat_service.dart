// chat_service.dart

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_service.g.dart';

abstract class ChatService {
  Stream<String> get stream;
  Stream<bool> get connStream;
  bool isConnected = false;
  void dispose();
  bool sendMessage(String msg);
}

class ChatServiceImpl implements ChatService {
  final WebSocketChannel _channel;
  final StreamController<String> _controller = StreamController.broadcast();
  final StreamController<bool> _connController = StreamController.broadcast();
  @override
  bool isConnected = false;

  @override
  Stream<String> get stream => _controller.stream;
  @override
  Stream<bool> get connStream => _connController.stream;

  ChatServiceImpl() : _channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org/')) {
    _init();
  }

  void _init() async {
    _connController.add(false);

    _channel.stream.listen(
      (message) => _controller.add(message),
      onDone: () {
        isConnected = false;
        debugPrint("finish stream");
        _connController.add(false);
      },
      onError: (error) {
        debugPrint("stream Error: $error");
        isConnected = false;
        _connController.add(false);
      },
      cancelOnError: true,
    );

    try {
      await _channel.ready;
      isConnected = true;
      _connController.add(true);
    } on SocketException catch (error) {
      isConnected = false;
      debugPrint("SocketException Error: $error");
      _connController.add(false);
    } on WebSocketChannelException catch (error) {
      debugPrint("WebSocketChannelException Error: $error");
      isConnected = false;
      _connController.add(false);
    }
  }

  @override
  void dispose() {
    _connController.close();
    _controller.close();
    _channel.sink.close(status.normalClosure);
  }

  @override
  bool sendMessage(String message) {
    if (!isConnected) {
      return false;
    }
    debugPrint("sendMessage $message");
    _channel.sink.add(message);

    return true;
  }
}

@riverpod
ChatService chatService(Ref ref) {
  final service = ChatServiceImpl();

  ref.onDispose(() => service.dispose());

  return service;
}
