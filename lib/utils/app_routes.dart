abstract class Routes {
  static const String main = "/";
  static const String signInPage = "/signIn";
  static const String signUpPage = "/signUp";

  static const String nfc = '/nfc';
  static const String wifi = '/wifi';
  static const String profile = '/profile';
}

enum MenuRoute {
  nfc('/nfc'),
  wifi('/wifi'),
  profile('/profile');

  final String path;
  const MenuRoute(this.path);
}
