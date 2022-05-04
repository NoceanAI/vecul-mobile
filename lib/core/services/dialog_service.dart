import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/error_dialog.dart';
import 'package:vecul/ui/widgets/success_dialog.dart';


class DialogService{
  final NavigatorService _navigatorService = locator<NavigatorService>();

  showErrorDialog(String message){
    showDialog(
      context: _navigatorService.context,
      barrierDismissible: true,
      builder: (context) {
        return GestureDetector(
          onTap: _navigatorService.goBack,
          child: ErrorDialog(
            message: message,
          ),
        );
      },
    );
  }


  showSuccessDialog(String title, String message){
    showDialog(
      context: _navigatorService.context,
      barrierDismissible: true,
      builder: (context) {
        return GestureDetector(
          onTap: _navigatorService.goBack,
          child: SuccessDialog(
            title: title,
            message: message,
          ),
        );
      },
    );
  }


  showWarningDialog(String message){
    return ScaffoldMessenger.of(_navigatorService.context).showSnackBar(
      SnackBar(
          duration: const Duration(milliseconds: 1000),
          backgroundColor: AppColors.red,
          content: Text(message,
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.white,
            ),
          )),
    );
  }
}