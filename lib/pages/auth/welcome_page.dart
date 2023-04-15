import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/ui/buttons.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color373737,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                'assets/images/signIn-page/Logo.png',
                height: 76,
              ),
             Spacer(flex: 1),
              Text(
                'Cardify',
                style: TextStyle(
                  fontFamily: 'CraftworkGrotesk',
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                   color: Colors.white
                ),
              ),
              Spacer(flex: 1),
              Text('The versatile app for\nversatile people’s cards', style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white
                ),),
              Spacer(flex: 2),
              PrimaryButton(
                width: 300,
                height: 44,
                onTap: () {
                  context.push(Routes.signInPage);
                },
                color: AppColors.color12D18E,
                child: Text('Log in'),
              ),
              SizedBox(
                height: 22,
              ),
              PrimaryButton(
                width: 300,
                height: 44,
                onTap: () {
                  context.push(Routes.signUpPage);
                },
                color: AppColors.colorD7FFCA,
                child: Text('Create an account'),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
