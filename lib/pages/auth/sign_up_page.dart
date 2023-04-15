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
  final _textFormNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(authService: authService),
      child: Scaffold(
        backgroundColor: AppColors.color373737,
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
                            'assets/images/signIn-page/Logo.png',
                            height: 76,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            'Registration',
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          // Flexible(flex: 1, child: Container()),
                          const SizedBox(
                            height: 150,
                          ),
                          // Expanded(child: SizedBox()),
                          PrimaryTextField(
                            controller: _textFormLoginController,
                            labelText: 'Enter your Username...',
                            labelStyle: TextStyle(color: AppColors.color7D7D7D),
                            validator: (e) {},
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          PrimaryTextField(
                            controller: _textFormPasswordController,
                            labelText: 'Enter your E-mail...',
                            labelStyle: TextStyle(color: AppColors.color7D7D7D),
                            validator: (e) {},
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          PrimaryTextField(
                            controller: _textFormNameController,
                            labelText: 'Enter your Password...',
                            labelStyle: TextStyle(color: AppColors.color7D7D7D),
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
                                  //signUp
                                  context.read<SignUpBloc>().add(
                                        SignUpReg(
                                          email: _textFormNameController.text,
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
                                      'Create an Account',
                                      style: TextStyle(
                                        fontFamily: 'SpaceGrotesk',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.averageGrey,
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
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.colorD6D6D6,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  context.pop();
                                },
                                child: Container(
                                  height: 50,
                                  child: Center(
                                    child: const Text(
                                      'Go Back',
                                      style: TextStyle(
                                        fontFamily: 'SpaceGrotesk',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.averageGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
