import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';

import '../../service/api_requests.dart';
import '../../ui/text_fields.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import 'bloc/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final authService = Injector().get<AuthService>();

  final _textFormLoginController = TextEditingController();
  final _textFormPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(authService: authService),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInError) {
              _showSnackBar(context: context, text: state.error);
            } else if (state is SignInSuccess) {
              context.go(Routes.qrCode);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: <Widget>[
                    Flexible(flex: 2, child: Container()),
                    Text(
                      'Вход',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 35,
                      ),
                    ),
                    Flexible(flex: 1, child: Container()),
                    Row(
                      children: [
                        Text(
                          'Логин',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    PrimaryTextField(
                      controller: _textFormLoginController,
                      labelText: '',
                      labelStyle: TextStyle(),
                      validator: (e) {},
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Пароль',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    PrimaryTextField(
                      controller: _textFormPasswordController,
                      labelText: '',
                      labelStyle: TextStyle(),
                      validator: (e) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.color7e56e8,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              // signIn
                              context.read<SignInBloc>().add(
                                    SignInAuth(
                                      login: _textFormLoginController.text,
                                      password:
                                          _textFormPasswordController.text,
                                    ),
                                  );
                            },
                            child: Container(
                              height: 50,
                              child: Center(
                                child: const Text(
                                  'Войти',
                                  style: TextStyle(
                                      fontFamily: 'VarelaRound',
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: CupertinoButton(
                          onPressed: () {
                            context.go(Routes.signUpPage);
                          },
                          child: Text(
                            "Регистрация",
                            style: TextStyle(
                              color: AppColors.color7e56e8,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(flex: 3, child: Container()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
