abstract class Routes {
  static const String main = "/";
  static const String signInPage = "/signIn";
  static const String signUpPage = "/signUp";
  static const String welcome = '/welcome';

  static const String qrCode = '/qrCode';
    static const String qrCodeGenerate = '/qrCode/generate';
  static const String editor = '/editor';
static const String share = '/share';
static const String cardHolder = '/cardHolder';

}

enum MenuRoute {
  editor('/editor'),
  share('/share'),
  cardHolder('/cardHolder');

  final String path;
  const MenuRoute(this.path);
}
