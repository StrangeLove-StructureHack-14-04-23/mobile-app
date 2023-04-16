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
      if (data != '' && data['jwt'] != '' && data['user_id'] != '') {
        await prefs.setString('token', data['jwt']);
        await prefs.setString('id', data['user_id'].toString());
        print('${data['user_id']} -- id');
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
    String first_name = 'hello',
    String last_name = 'my',
    String description = 'friend',
  }) async {
    dynamic data = await APIService.postRequest(
      request: 'api/register',
      data: {
        'username': username,
        'email': email,
        'password': password,
        'first_name': first_name,
        'last_name': last_name,
        'description': description
      },
    );

    try {
      if (data != '' && data['username'] != '' && data['id'] != '') {
        await prefs.setString('token', data['username']);
        await prefs.setString('id', data['id'].toString());
        print('${data['id']} -- id');
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
