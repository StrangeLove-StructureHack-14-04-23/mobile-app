import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';

import '../../service/api_requests.dart';
import '../../ui/text_fields.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import 'bloc/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final authService = Injector().get<AuthService>();

  final _textFormLoginController = TextEditingController();
  final _textFormPasswordController = TextEditingController();
  final _textFormEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(authService: authService),
      child: Scaffold(
        backgroundColor: AppColors.colorF8FCFF,
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpError) {
              _showSnackBar(context: context, text: state.error);
            } else if (state is SignUpSuccess) {
              context.go(Routes.home);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
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
                          const SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Регистрация',
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff4285F4)),
                          ),
                          // Flexible(flex: 1, child: Container()),
                          const SizedBox(
                            height: 30,
                          ),
                          // Expanded(child: SizedBox()),
                          PrimaryTextField(
                            controller: _textFormLoginController,
                            labelText: 'Введите логин...',
                            labelStyle: TextStyle(color: AppColors.color535353.withOpacity(0.8)),
                            validator: (e) {},
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          PrimaryTextField(
                            controller: _textFormEmailController,
                            labelText: 'Введите E-mail...',
                            labelStyle: TextStyle(color: AppColors.color535353.withOpacity(0.8)),
                            validator: (e) {},
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          PrimaryTextField(
                            controller: _textFormPasswordController,
                            labelText: 'Введите пароль...',
                            labelStyle: TextStyle(color: AppColors.color535353.withOpacity(0.8)),
                            validator: (e) {},
                            isPasswordField: true,
                          ),
                          const SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xff4285F4)
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  //signUp
                                  context.read<SignUpBloc>().add(
                                        SignUpReg(
                                          email: _textFormEmailController.text,
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
                                      'Создать',
                                      style: TextStyle(
                                        fontFamily: 'SpaceGrotesk',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
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
                                context.go(Routes.signInPage);
                              },
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: const Text(
                                    'Уже есть аккаунт?',
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
                          const SizedBox(
                            height: 22,
                          ),
                        ],
                      ),
                    ),
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}