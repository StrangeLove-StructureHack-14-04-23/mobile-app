part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpReg extends SignUpEvent {
  final String login;
  final String password;
  final String email;

  SignUpReg({
    required this.login,
    required this.password,
    required this.email,
  });
}
