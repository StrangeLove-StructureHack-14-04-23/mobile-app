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
        backgroundColor: AppColors.color373737,
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
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  children: <Widget>[
                    // Flexible(flex: 2, child: Container()),
                    const SizedBox(
                      height: 54,
                    ),
                    Image.asset(
                      'assets/images/signIn-page/Logo.png',
                      height: 76,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    // Flexible(flex: 1, child: Container()),
                    const SizedBox(
                      height: 192,
                    ),
                    PrimaryTextField(
                      controller: _textFormLoginController,
                      labelText: 'Enter your Username...',
                      labelStyle: TextStyle(),
                      validator: (e) {},
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    PrimaryTextField(
                      controller: _textFormPasswordController,
                      labelText: 'Enter your Password...',
                      labelStyle: TextStyle(),
                      validator: (e) {},
                      isPasswordField: true,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      width: 120,
                      child: Column(
                        children: const [
                          Divider(
                            thickness: 1,
                            height: 8,
                            color: AppColors.color12D18E,
                          ),
                          Divider(
                            thickness: 1,
                            height: 8,
                            color: AppColors.color12D18E,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.color12D18E,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            // signIn
                            context.read<SignInBloc>().add(
                                  SignInAuth(
                                    login: _textFormLoginController.text,
                                    password: _textFormPasswordController.text,
                                  ),
                                );
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontFamily: 'VarelaRound',
                                    fontSize: 20,
                                    color: AppColors.averageGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.colorD7FFCA,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            // signIn
                            context.read<SignInBloc>().add(
                                  SignInAuth(
                                    login: _textFormLoginController.text,
                                    password: _textFormPasswordController.text,
                                  ),
                                );
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: const Text(
                                'Go Back',
                                style: TextStyle(
                                    fontFamily: 'VarelaRound',
                                    fontSize: 20,
                                    color: Colors.black),
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
