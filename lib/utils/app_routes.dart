abstract class Routes {
  static const String main = "/";
  static const String signInPage = "/signIn";
  static const String signUpPage = "/signUp";
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String waysToShare = '/waysToShare';
}

enum MenuRoute {
  home('/home'),
  profile('/profile');

  final String path;
  const MenuRoute(this.path);
}
