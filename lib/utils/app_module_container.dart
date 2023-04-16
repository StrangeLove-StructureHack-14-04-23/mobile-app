import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mobile_app/service/card_requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/api_requests.dart';

class ModuleContainer {
  static Future<Injector> initialize(Injector injector) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    injector.map<AuthService>((i) => AuthService(prefs: preferences),
        isSingleton: true);
    injector.map<CardService>((i) => CardService(prefs: preferences),
        isSingleton: true);
    return injector;
  }
}
