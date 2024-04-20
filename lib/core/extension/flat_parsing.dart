extension FlagParsing on String {
  String extractCountry() {
    final splitString = split(RegExp(r'\s{2,}'));
    return splitString.last.replaceAll('null', '');
  }
}

extension StringParser on String {
  String getCity() {
    final parts = split(','); // Virgülle ayır
    return parts.length > 1
        ? parts[1].trim()
        : ''; // Eğer virgül varsa ikinci kısmı döndür
  }
}
