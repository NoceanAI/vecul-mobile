import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/authentication/auth_view_model.dart';

import 'package:vecul/ui/widgets/dismiss_keyboard.dart';

import 'login/login_view.dart';
import 'sign_up/sign_up_view.dart';

class AuthView extends StatefulWidget {
  ///Tab index of 0 for login and 1 for sign up;
  final int tabIndex;
  const AuthView({Key? key, this.tabIndex = 0}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with TickerProviderStateMixin{
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.animateTo(widget.tabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  DismissKeyboard(
      child: Scaffold(
        body: DismissKeyboard(
          child: ViewModelBuilder<AuthViewModel>.reactive(
            disposeViewModel: false,
            builder: (context, model, child) {
              return Column(
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
                    child: Column(
                      children: [
                        TabBar(
                          labelStyle: TextStyle(
                            fontFamily: sfPro,
                            fontSize: 17.sp,
                            color: AppColors.black33,
                          ),
                          controller: tabController,
                          indicatorWeight: 3.h,
                          indicatorColor: AppColors.blue00,
                          labelColor: AppColors.black33,
                          unselectedLabelColor: Colors.black.withOpacity(0.1),
                          tabs: const [
                            Tab(text: 'Login'),
                            Tab(text: 'Sign Up'),
                          ],
                        ),
                         Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: const[
                              LoginView(),
                              SignUpView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }, viewModelBuilder: () => locator<AuthViewModel>(),
          ),
        ),
      ),
    );
  }
}




