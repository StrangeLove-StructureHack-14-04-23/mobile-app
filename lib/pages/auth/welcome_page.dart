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
        child: Column(
          children: [
            Spacer(),
            Container(height: 100, color: Colors.red),
            Spacer(),
            Text('Cardify'),
            Spacer(),
            Text('The versatile app for\nversatile people’s cards'),
            Spacer(),
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
    );
  }
}
