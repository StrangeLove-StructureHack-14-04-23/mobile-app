abstract class Routes {
  static const String main = "/";
  static const String signInPage = "/signIn";
  static const String signUpPage = "/signUp";
  static const String welcome = '/welcome';

  static const String editor = '/editor';
  static const String profile = '/profile';
  static const String share = '/share';
  static const String cardHolder = '/cardHolder';
  static const String public = '/public';
    static const String home = '/home';
}

enum MenuRoute {
  home('/home'),
  cardHolder('/cardHolder'),
  editor('/editor'),
  public('/public');

  final String path;
  const MenuRoute(this.path);
}
