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
        backgroundColor: AppColors.colorF8FCFF,
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInError) {
              _showSnackBar(context: context, text: state.error);
            } else if (state is SignInSuccess) {
              context.go(Routes.home);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // Flexible(flex: 2, child: Container()),
                      const SizedBox(
                        height: 54,
                      ),
                      Image.asset(
                        'assets/images/signIn-page/Logo2.png',
                        height: 76,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        'Cardify',
                        style: TextStyle(
                          fontFamily: 'Phosphate',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff4285F4),
                        ),
                      ),
                      // Flexible(flex: 1, child: Container()),
                      const SizedBox(
                        height: 192,
                      ),
                      PrimaryTextField(
                        controller: _textFormLoginController,
                        labelText: 'Введите логин...',
                        labelStyle: TextStyle(
                          color: AppColors.color535353,
                        ),
                        validator: (e) {},
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      PrimaryTextField(
                        controller: _textFormPasswordController,
                        labelText: 'Введите пароль...',
                        labelStyle: TextStyle(
                          color: AppColors.color535353,
                        ),
                        validator: (e) {},
                        isPasswordField: true,
                      ),
                      const SizedBox(height: 31,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.color1790FF,
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
                                  'Вход',
                                  style: TextStyle(
                                      fontFamily: 'SpaceGrotesk',
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            // signIn
                            context.push(Routes.signUpPage);
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: const Text(
                                'Регистрация',
                                style: TextStyle(
                                      fontFamily: 'SpaceGrotesk',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff535353),
                                      decoration: TextDecoration.underline
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   child: Center(
                      //     child: CupertinoButton(
                      //       onPressed: () {
                      //         context.go(Routes.signUpPage);
                      //       },
                      //       child: Text(
                      //         "Регистрация",
                      //         style: TextStyle(
                      //           color: AppColors.color7e56e8,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
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
