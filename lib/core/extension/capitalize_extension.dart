extension CapitalizeLetter on String {
  // İlk harfi büyük harf yapar.
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  // Her kelimenin ilk harfini büyük harf yapar.
  String capitalizeLetter() {
    if (isEmpty) {
      return this;
    }
    final words = split(' ');
    final capitalizedWords = words.map((word) {
      if (word.isEmpty) {
        return word;
      }
      return '${word[0].toUpperCase()}${word.substring(1)}';
    });
    return capitalizedWords.join(' ');
  }
}
