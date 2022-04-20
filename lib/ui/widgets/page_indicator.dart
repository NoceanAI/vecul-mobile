import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

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