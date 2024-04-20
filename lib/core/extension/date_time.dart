import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String format(DateFormat format) {
    return format.format(this);
  }

  String formatYYYYMMdd() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

extension DateFormatting on String {
  // Tarihi "16 Kasım" formatında al
  String getFormattedDate(String language) {
    try {
      final dateTime = DateFormat('yyyy.MM.dd').parse(replaceAll('-', '.'));
      return DateFormat('dd MMMM', language).format(dateTime);
    } catch (e) {
      return this;
    }
  }

  // Günü "Perşembe" formatında al
  String getFormattedDay(String language) {
    try {
      final dateTime = DateFormat('yyyy.MM.dd').parse(replaceAll('-', '.'));
      return DateFormat('EEEE', language).format(dateTime);
    } catch (e) {
      return this;
    }
  }
}
