import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AppHiveStart {
  const AppHiveStart._();

  static Future<void> init() async {
    /*    await Hive.initFlutter();
    Hive
      ..registerAdapter(MessageTimelineModelAdapter())
          ..registerAdapter(MessageInfoModelAdapter())
      ..registerAdapter(MessageReactionsModelAdapter()) 
      ..registerAdapter(GroupJoinedUsersAdapter());
    await Hive.openBox<List<MessageTimelineModel>>('chatBox');
    await Hive.openBox<List<MessageInfoModel>>('chatBoxDetails');*/
    //Hive.registerAdapter(GroupJoinedUsersAdapter());
  }
}
