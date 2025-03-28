// chat_service.dart

import 'dart:async';
import 'dart:io';

import 'package:app_flutter/core/utils/logger.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ChatService {
  Stream<String> get stream;
  Stream<bool> get connStream;
  bool isConnected = false;
  void dispose();
  bool sendMessage(String msg);
}

class ChatServiceImpl implements ChatService {
  final _logTag = 'ChatServiceImpl';

  WebSocketChannel? _channel;
  final StreamController<String> _controller = StreamController.broadcast();
  final StreamController<bool> _connController = StreamController.broadcast();
  @override
  bool isConnected = false;
  @override
  Stream<String> get stream => _controller.stream;
  @override
  Stream<bool> get connStream => _connController.stream;

  ChatServiceImpl() {
    _init();
  }

  void _init() async {
    _connController.add(false);
    _channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org/'));

    _channel?.stream.listen(
      (message) {
        Logger.info(_logTag, "receiveMessage $message");
        _controller.add(message);
      },
      onDone: () {
        isConnected = false;
        Logger.info(_logTag, "finish stream");
        _connController.add(false);
        _reConnect();
      },
      onError: (error) {
        Logger.error(_logTag, "error stream", error: error);
        isConnected = false;
        _connController.add(false);
        _reConnect();
      },
      cancelOnError: true,
    );

    try {
      await _channel?.ready;
      isConnected = true;
      _connController.add(true);
    } on SocketException catch (error) {
      isConnected = false;
      Logger.error(_logTag, "SocketException", error: error);
      _connController.add(false);
      _reConnect();
    } on WebSocketChannelException catch (error) {
      Logger.error(_logTag, "WebSocketChannelException", error: error);
      isConnected = false;
      _connController.add(false);
      _reConnect();
    }
  }

  void _reConnect() {
    Future.delayed(
      Duration(milliseconds: 2000),
      () => _init(),
    );
  }

  @override
  bool sendMessage(String message) {
    if (!isConnected) {
      return false;
    }
    Logger.info(_logTag, "sendMessage");

    _channel?.sink.add(message);

    return true;
  }

  @override
  void dispose() {
    _connController.close();
    _controller.close();
    _channel?.sink.close(status.normalClosure);
  }
}
