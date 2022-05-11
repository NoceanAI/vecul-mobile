import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class PageIndicator extends StatelessWidget {
  final bool isActive;
  final double? radius;
  final Color? activeColor;
  final Color? inactiveColor;
  const PageIndicator({Key? key, required this.isActive, this.radius, this.activeColor, this.inactiveColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: radius??9.r,
      width: radius??9.r,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color: isActive?activeColor??AppColors.blue00: inactiveColor??AppColors.greyC8,
      ),
    );
  }
}