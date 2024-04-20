import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //instance
  NotificationService._init();
  static final NotificationService instance = NotificationService._init();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Bildirim servisinin başlatılması
  Future<void> init() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // Uygulama ikonu

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Yerel bildirim gönderme
  Future<void> showNotification(String title, String body) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  Future<void> showEveryNotification(
    int id,
    String title,
    String body, {
    required int day,
    required int notificationHours,
  }) async {
    // Android için bildirim detaylarını ayarla
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'week_your_channel_id',
      'week_your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

    // iOS için bildirim detaylarını ayarla
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    // Bildirim detaylarını birleştir
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    final nowInIstanbul = tz.TZDateTime.now(tz.getLocation('Europe/Istanbul'));

    final scheduledDate = _nextInstanceOf(
      day: day,
      hours: notificationHours,
      now: nowInIstanbul,
    );
    // Bildirimi planla
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  // Gelecek gün için tarih hesaplama fonksiyonu
  tz.TZDateTime _nextInstanceOf({
    required int day,
    required int hours,
    required tz.TZDateTime now,
  }) {
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hours - 3,
    );

    while (scheduledDate.weekday != day) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 7));
    }

    return scheduledDate;
  }
}
