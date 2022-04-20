import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

import 'package:vecul/ui/widgets/dismiss_keyboard.dart';

import 'login/login_view.dart';
import 'sign_up/sign_up_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyboard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70.h),
            Hero(
              tag: 'vecul',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  'vecul.co',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w500,
                    fontFamily: sfPro,
                  ),
                ),
              ),
            ),
            SizedBox(height: 45.h),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: TextStyle(
                        fontFamily: sfPro,
                        fontSize: 17.sp,
                        color: AppColors.black33,
                      ),
                      indicatorWeight: 3.h,
                      indicatorColor: AppColors.blue00,
                      labelColor: AppColors.black33,
                      unselectedLabelColor: Colors.black.withOpacity(0.1),
                      tabs: const [
                        Tab(text: 'Login'),
                        Tab(text: 'Sign Up'),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          LoginView(),
                          SignUpView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




