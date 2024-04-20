import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:togodo/core/constants/constants.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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

  late IOWebSocketChannel _channel;

  Future<void> connect(String token) async {
    final baseUrl = dotenv.env['BASE_URL'] ?? Constants.instance.endpoint;
    final url = 'wss://$baseUrl/ChatHub';
    final headers = <String, dynamic>{
      'Authorization': 'Bearer $token',
      'Connection': 'Upgrade',
      'Upgrade': 'websocket',
    };
    _channel = IOWebSocketChannel.connect(
      url,
      headers: headers,
    );

    _channel.sink.add('${jsonEncode({"protocol": "json", "version": 1})}');
  }

  Stream<dynamic> get messages => _channel.stream;
  WebSocketSink get sink => _channel.sink;
}
