import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/api_requests.dart';

class ModuleContainer {
  static Future<Injector> initialize(Injector injector) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    injector.map<AuthService>((i) => AuthService(prefs: preferences),
        isSingleton: true);
    return injector;
  }
}
