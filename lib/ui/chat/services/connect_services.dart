import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:togodo/core/constants/constants.dart';

/* {
    "type": 1,
    "target": "SendMessage",
    "arguments": [
        "45039c44-9f93-4e94-a1a6-7934328ac030",  //UserId
        "selam nasılsın", //mesaj
        1, //mesaj tipi
        "", //yanıt verilen mesajId
        [] // base64 file
    ]
} */
// 1 - Text Message / 2 - Image Message / 3 - File Message

class WebSocketService {
  WebSocketService._privateConstructor();

  static final WebSocketService instance =
      WebSocketService._privateConstructor();

  IO.Socket? _channel;
  bool isConnected = false;
  Future<void> connect(String token) async {
    print("deneme socket connect");
    print("gelen token: $token ");
    print("_chenl data : $_channel ");

    if (_channel == null) {
      final baseUrl = dotenv.env['BASE_URL'] ?? Constants.instance.endpoint;

      _channel = IO.io(
        'ws://$baseUrl',
        IO.OptionBuilder()
            .setTransports(['websocket']) // Use WebSocket transport only
            .setExtraHeaders(
          {'Authorization': 'Bearer $token'},
        ) // Set headers if needed
            .build(),
      );
      _channel?.connect();
      _channel?.onAny((event, data) {
        if (event == "connect") {
          _channel?.emit('saveUser', {"token": token});
        }
      });
    }
    if ((_channel?.connected ?? false) == false) {
      _channel?.connect();
    }

    //_channel.onAny((event, data) => null);

    //_channel.sink.add('${jsonEncode({"protocol": "json", "version": 1})}');
  }

  onData(Function(String event, dynamic data) onCall,
      Function(dynamic data) onError) {
    _channel?.onAny((event, data) => {
          print('onAnyde'),
          print(event),
          print(data),
          onCall(event, data),
        });
    _channel?.onError((data) => {
          print('onErrorda'),
          print(data),
          onError(data),
        });
  }

  sink(bool isSearch, dynamic data, dynamic token) {
    _channel?.emit('connectToRoom',
        {isSearch ? "userId" : "chatRoomId": data, "token": token});
  }

  sinkDissconnect(dynamic data) {
    _channel?.emit('disconnectToRoom', {"token": data});
  }

  getAllChatdata(dynamic data) {
    _channel?.emit('getMessages', {"token": data});
  }

  void close() {
    print("deneme socket close");
    _channel?.clearListeners();
    _channel?.disconnect();
    _channel?.dispose();
    _channel = null;
  }
}
