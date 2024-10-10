// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an authentication [endpoint].
  static String auth(AuthEndpoint endpoint) {
    switch (endpoint) {
      case AuthEndpoint.LOGIN:
        return 'Auth/FirebaseLogin';
      case AuthEndpoint.CREATE_EVENT:
        return 'Event/Create';
      case AuthEndpoint.CHECK_USER:
        return 'Auth/CheckUser';
      case AuthEndpoint.UPDATE_EVENT:
        return 'Event/Update';
      case AuthEndpoint.UPLOAD_PROFIL_PICTURE:
        return 'User/UpdateImages';
      case AuthEndpoint.UPDATE_PROFILE:
        return 'User/Update';
      case AuthEndpoint.SEND_IMAGE:
        return 'Message/Create';
      case AuthEndpoint.SEND_MESSAGE:
        return 'Chat/SendMessage';
      case AuthEndpoint.CREATE_GROUP_CHAT_ROOM:
        return 'Message/CreateGroupChatRoom';
      case AuthEndpoint.ADD_CHAT_MEMBER:
        return 'Message/AddChatMember';
      case AuthEndpoint.REMOVE_CHAT_MEMBER:
        return 'Message/RemoveChatMember';
      case AuthEndpoint.MUTE_ROOM:
        return 'Message/MutedRoom';
      case AuthEndpoint.LEAVE_GROUP:
        return 'Message/LeaveGroup';
      case AuthEndpoint.TEST:
        return 'Auth/SmsVerification';
      case AuthEndpoint.CREATE_EVENT_REQUEST:
        return 'Event/CreateRequest';
      case AuthEndpoint.DELETE_USER:
        return 'User/DeleteAccount';
      case AuthEndpoint.SEND_MESSAGE_GROUP:
        return 'Chat/SendMessageEventGroup';
    }
  }
}

class PrivacyURl {
  static const String privacyUrl = 'https://togodo.co/gizlilik-politikasi/';
  static const String termsUrl = 'https://togodo.co/kullanim-kosullari/';
  static const String kullanimVeIcerikUrl =
      'https://togodo.co/kullanim-ve-icerik-politikalari/';
  static const String kvkkUrl =
      'https://togodo.co/kvkk-kapsaminda-acik-riza-beyani/';
}

/// A collection of endpoints used for authentication purposes.
enum AuthEndpoint {
  /// An endpoint for login requests.
  LOGIN,
  CREATE_EVENT,
  UPDATE_EVENT,
  UPLOAD_PROFIL_PICTURE,
  UPDATE_PROFILE,
  SEND_IMAGE,
  SEND_MESSAGE,
  CREATE_GROUP_CHAT_ROOM,
  ADD_CHAT_MEMBER,
  REMOVE_CHAT_MEMBER,
  MUTE_ROOM,
  LEAVE_GROUP,
  CREATE_EVENT_REQUEST,
  DELETE_USER,
  CHECK_USER,
  TEST,
  SEND_MESSAGE_GROUP,
}
