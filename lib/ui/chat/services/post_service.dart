import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';

class PostService {
  Future<bool> sendMessage(
    String messageText,
    Dio dio, {
    String? chatRoomId, // Timelineden huba bağlanırken yafa Hubdayken
    String? receiverUserId, // Bildirimden , search veya timeline'dan giderken
    String? replyMessageId,
    String? eventId,
    bool isReplied = false,
    String? contentType,
    List<File>? file,
    bool isGroup = false,
  }) async {
    try {
      final files = <MultipartFile>[];
      var formData = FormData();
      if (file.ext.isNotNullOrEmpty) {
        for (final element in file!) {
          final fileName = element.path.split('/').last;
          files.add(
            await MultipartFile.fromFile(
              element.path,
              filename: fileName,
            ),
          );
          contentType = getFileType(element.path);
        }
      }
      formData = FormData.fromMap(
        {
          'ChatRoomId': chatRoomId,
          'ReceiverUserId': receiverUserId,
          'MessageText': messageText,
          'FormFiles': files,
          'RepliedMessageId': replyMessageId,
          'IsReplied': isReplied,
          'EventId': eventId,
          'ContentType': contentType ?? '1',
          'IsGroupChat': isGroup,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        ApiEndpoint.auth(AuthEndpoint.SEND_MESSAGE),
        data: formData,
      );
      print("burda response status code ${response.statusCode}");
      if (response.statusCode == 201) {
        return true;
      } else {
        log('File upload failed!');
        throw Exception('Failed to upload file');
      }
    } catch (e) {
      log('exception caught: $e');
      throw Exception('Failed to upload file: $e');
    }
  }
}
