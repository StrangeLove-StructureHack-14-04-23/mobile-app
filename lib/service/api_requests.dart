// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

class AuthService {
  final SharedPreferences prefs;

  String _token = '';

  get token => _token;

  AuthService({
    required this.prefs,
  }) {
    _token = prefs.getString('token') ?? '';
  }

  Future<String> loginUser({
    required String username,
    required String password,
  }) async {
    dynamic data = await APIService.postRequest(
      request: 'api/login',
      data: {'username': username, 'password': password},
    );

    try {
      if (data != '' && data['jwt'] != '') {
        await prefs.setString('token', data['jwt']);
        _token = data['jwt'];
        return 'Token: ${data['jwt']}';
      }
    } catch (e) {
      return 'Такого пользователя не существует или введен неправильный пароль.';
    }

    return 'Такого пользователя не существует или введен неправильный пароль.';
  }

  Future<String> regUser({
    required String username,
    required String email,
    required String password,
    String first_name = '',
    String last_name = '',
    String description = '',
  }) async {
    dynamic data = await APIService.postRequest(
      request: 'api/register',
      data: {
        'username': username,
        'email': email,
        'password': password,
        'first_name': '123',
        'last_name': '123',
        'description': '123'
      },
    );

    try {
      if (data != '' && data['username'] != '') {
        await prefs.setString('token', data['username']);
        _token = data['username'];
        return 'Token: ${data['username']}';
      }
    } catch (e) {
      print(e);
      return 'Вероятно, такой пользователь существует. Попробуйте войти в аккаунт.';
    }

    return 'Вероятно, такой пользователь существует. Попробуйте войти в аккаунт.';
  }

  signOut() async {
    _token = '';
    await prefs.setString('token', _token);
  }
}
