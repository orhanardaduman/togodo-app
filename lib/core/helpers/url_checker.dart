class UrlChecker {
  static final urlCheckReg = RegExp('((http|https)://)(www.)?'
      r'[a-zA-Z0-9@:%._\+~#?&//=]'
      r'{2,256}\.[a-z]'
      r'{2,6}\b([-a-zA-Z0-9@:%'
      r'._\+~#?&//=]*)');

  static final checkImageUrlReg =
      RegExp(r'(https?:\/\/.*\.(?:jpg|jpeg|png|webp|avif|gif|svg))');

  static bool isImageUrl(String url) {
    return checkImageUrlReg.hasMatch(url);
  }

  static bool isValid(String url) {
    return urlCheckReg.hasMatch(url);
  }
}
