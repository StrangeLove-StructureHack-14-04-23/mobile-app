part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInAuth extends SignInEvent {
  final String login;
  final String password;

  SignInAuth({
    required this.login,
    required this.password,
  });
}