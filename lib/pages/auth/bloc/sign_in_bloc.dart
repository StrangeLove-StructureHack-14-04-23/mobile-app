import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service/api_requests.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthService authService;

  SignInBloc({required this.authService}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      String response = 'error';

      if (event is SignInAuth) {
        emit(SignInLoading());
        response = await authService.loginUser(
            username: event.login, password: event.password);
      }
      if (response.contains('Token: ')) {
        emit(SignInSuccess(token: response));
      } else {
        emit(SignInError(error: response));
      }
    });
  }
}