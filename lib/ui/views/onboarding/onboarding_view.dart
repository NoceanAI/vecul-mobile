import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/core/services/navigator_service.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/onboarding/onboarding_view_model.dart';
import 'package:vecul/ui/widgets/custom_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final PageController _pageController = PageController();
  final NavigatorService _navService = locator<NavigatorService>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Opacity(
        opacity: _controller.value,
        child: ViewModelBuilder<OnboardingViewModel>.reactive(
          disposeViewModel: true,
          builder: (context,model, child) {
            return SingleChildScrollView(
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
                  SizedBox(
                    height: 357.r,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: model.onPageChanged,
                      children: [
                        Image.asset(
                          onboardingImage1,
                          width: 391.r,
                          height: 357.r,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          onboardingImage2,
                          width: 391.r,
                          height: 357.r,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    'Endless Options',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColors.black33,
                      fontWeight: FontWeight.w500,
                      fontFamily: sfPro,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      'Choose from hundreds of models you won\'t find anywhere',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.black4F,
                        fontWeight: FontWeight.w300,
                        fontFamily: sfUI,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Visibility(
                              visible: model.currentIndex == 1,
                              maintainState: true,
                              maintainSize: true,
                              maintainAnimation: true,
                              child: InkWell(
                                onTap: () {
                                  _pageController.animateToPage(
                                    0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(5.r),
                                  child: Icon(
                                    CupertinoIcons.left_chevron,
                                    color: AppColors.blue00,
                                    size: 20.r,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            PageIndicator(isActive: model.currentIndex == 0),
                            SizedBox(width: 9.r),
                            PageIndicator(isActive: model.currentIndex == 1),
                            const Spacer(),
                            Visibility(
                              visible: model.currentIndex == 0,
                              maintainState: true,
                              maintainSize: true,
                              maintainAnimation: true,
                              child: InkWell(
                                onTap: () {
                                  _pageController.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(5.r),
                                  child: Icon(
                                    CupertinoIcons.right_chevron,
                                    color: AppColors.blue00,
                                    size: 20.r,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        CustomButton(
                          onTap: () {},
                          text: 'Create Account',
                        ),
                        SizedBox(height: 10.h),
                        CustomButton(
                          onTap: () {
                            _navService.pushNamed(loginView);
                          },
                          buttonColor: Colors.transparent,
                          text: 'Login to account',
                          textColor: AppColors.blue,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }, viewModelBuilder: () => locator<OnboardingViewModel>(),
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final bool isActive;
  const PageIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 9.r,
      width: 9.r,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color: isActive?AppColors.blue00: AppColors.greyC8,
      ),
    );
  }
}
