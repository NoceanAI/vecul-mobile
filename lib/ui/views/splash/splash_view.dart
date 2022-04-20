import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _backgroundTween;
  late Animation<Color?> _textColorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _backgroundTween = ColorTween(begin: AppColors.blue, end: AppColors.white)
        .animate(_controller);
    _textColorTween = ColorTween(begin: AppColors.white, end: AppColors.blue)
        .animate(_controller);
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward().whenComplete(() {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 2),
              pageBuilder: (context, _, __){
            return const OnboardingView();
          })
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundTween.value,
      body: Center(
        child: Hero(
          tag: 'vecul',
          child: Text(
            'vecul.co',
            style: TextStyle(
              fontSize: 30.sp,
              color: _textColorTween.value,
              fontWeight: FontWeight.w500,
              fontFamily: sfPro,
            ),
          ),
        ),
      ),
    );
  }
}
