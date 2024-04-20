import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:togodo/core/network/api/app_dio.dart';

part 'chat_data_source.g.dart';

final chatDataSourceProvider = Provider(ChatDataSource.new);

@RestApi()
abstract class ChatDataSource {
  factory ChatDataSource(ProviderRef<dynamic> ref) =>
      _ChatDataSource(ref.read(dioProvider));

  // Yeni Grup Chati Oluştur
  @POST('Chat/CreateChatRoomWithGroup')
  Future<dynamic> createChatRoomWithGroup(@Body() Map<String, dynamic> data);

  // Grup Chatine Kullanıcı Ekle
  @POST('Chat/AddUserToGroupChat')
  Future<dynamic> addUserToGroupChat(@Body() Map<String, dynamic> data);

  // Grup Chatine Yönetici Ata
  @POST('Chat/AssignGroupChatManager')
  Future<dynamic> assignGroupChatManager(@Body() Map<String, dynamic> data);

  // Grup Chatinden Kullanıcı Çıkar
  @DELETE('Chat/RemoveGroupChatRoomUser')
  Future<dynamic> removeGroupChatRoomUser(@Body() Map<String, dynamic> data);

  // Mesaj Gönder
  @POST('Chat/SendMessage')
  Future<dynamic> sendMessage(@Body() Map<String, dynamic> data);

  // Birden Fazla Kullanıcıya Gönderi Gönderme
  @POST('Chat/SendMessageRange')
  Future<dynamic> sendMessageRange(@Body() Map<String, dynamic> data);

  // Mesaj Sil
  @DELETE('Chat/DeleteMessage')
  Future<dynamic> deleteMessage(@Body() Map<String, dynamic> data);

  // Mesaj Reaksiyonu Ekleme
  @POST('Chat/SendMessageReaction')
  Future<dynamic> sendMessageReaction(@Body() Map<String, dynamic> data);

  // Mesaj İletme
  @POST('Chat/SendForwardMessageToRoom')
  Future<dynamic> sendForwardMessageToRoom(@Body() Map<String, dynamic> data);

  // Chat Odasını Sessize Al veya Sesi Aç
  @POST('Chat/MuteOrUnmuteChatRoom')
  Future<dynamic> muteOrUnmuteChatRoom(@Body() Map<String, dynamic> data);

  // Chat Odasından Ayrıl
  @DELETE('Chat/LeaveChatRoom')
  Future<dynamic> leaveChatRoom(@Body() Map<String, dynamic> data);

  // Kullanıcı Yazıyor Durumu
  @POST('Chat/WritingTo')
  Future<dynamic> writingTo(@Body() Map<String, dynamic> data);

  // Detaydan çıkınca gönderilecek
  @POST('Chat/CloseChatRoom')
  Future<dynamic> closeChatRoom(@Body() Map<String, dynamic> data);

  @POST('Chat/PinOrUnpinChatRoom')
  Future<dynamic> pinChat(@Body() Map<String, dynamic> data);

  @PUT('Chat/UpdateGroupChatRoom')
  Future<dynamic> updateGroupChatRoom(@Body() Map<String, dynamic> data);
}
