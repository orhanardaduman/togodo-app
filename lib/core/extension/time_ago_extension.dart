import 'package:intl/intl.dart';

extension TimeAgo on DateTime {
  String timeAgo() {
    final difference = DateTime.now().difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} dk';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} s';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} g';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).round()} h';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).round()} ay';
    } else {
      return '${(difference.inDays / 365).round()} y';
    }
  }

  String timeAgoEn() {
    final difference = DateTime.now().difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} d';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).round()} w';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).round()} mo';
    } else {
      return '${(difference.inDays / 365).round()} y';
    }
  }
}

extension ParseAndFormat on String {
  DateTime? parseCustomDateFormat() {
    try {
      final parts = split(' ');
      if (parts.length != 2) return null;

      final dateParts = parts[0].split('.');
      final timeParts = parts[1].split(':');
      if (dateParts.length != 3 || timeParts.length != 3) return null;

      final day = int.parse(dateParts[0]);
      final month = int.parse(dateParts[1]);
      final year = int.parse(dateParts[2]);
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final second = int.parse(timeParts[2]);

      return DateTime(year, month, day, hour, minute, second);
    } catch (e) {
      // Hata durumunda null döndür veya uygun bir şekilde hata yönetimi yap
      return null;
    }
  }

  String formatCreatedAt() {
    final dateTime = DateTime.parse(this);
    final date = dateTime;
    return date
        .timeAgo(); // 'timeAgo' metodu DateTime nesnesi için tanımlı olmalıdır.
  }

  String formatCreatedAtEn() {
    final date = DateTime.parse(this);
    return date.timeAgoEn();
  }
}

extension DateAndFormat on DateTime {
  String formatCreatedDate() {
    final dateTime = this;
    final datePart = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
    );
    return datePart.toString();
  }

  String formatCreatedHours() {
    final dateTime = this;
    final formattedTime =
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }
}

extension DateFormatting on DateTime {
  String formatAsChatTime(String language) {
    final dateTime = this;
    final now = DateTime.now();

    // tarihlerin saat, dakika ve saniyelerini sıfırlarız, sadece yıl, ay ve gün kısmını karşılaştırırız
    final datePart = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (datePart == today) {
      return 'Bugün';
    } else if (datePart == yesterday) {
      return 'Dün';
    } else if (datePart.isAfter(today.subtract(const Duration(days: 7)))) {
      return DateFormat('EEEE', language)
          .format(dateTime); // haftanın gün ismini getirir
    } else {
      return DateFormat('d MMMM EEEE', language)
          .format(dateTime); // '10 Haziran Pzt' formatında döndürür
    }
  }
}

const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String getRelativeDate(String language) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(year, month, day);

    if (aDate.isSameDate(today)) {
      return language == 'en' ? 'Today' : 'Bugün';
    } else if (aDate.isSameDate(today.subtract(const Duration(days: 1)))) {
      return language == 'en' ? 'Yesterday' : 'Dün';
    } else {
      return DateFormat(dateFormatter, language)
          .format(this); // Burada language lokalizasyonunu kullandım
    }
  }
}
