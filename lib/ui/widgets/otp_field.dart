import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vecul/ui/exports.dart';

class OTPField extends StatelessWidget {

  ///Length of the pin field
  final int? length;

  ///When this is set to true, the value of the textfield can be edited with the native keyboard
  ///when false, the value can only be edited through a [TextEditingController]
  final bool readOnly;

  ///Used for managing and controlling the [OTPField] data;
  final TextEditingController? controller;

  final VoidCallback? onTap;

  final String? Function(String?)? validator;

  const OTPField({
    Key? key,
    this.length = 5,
    this.readOnly = false,
    this.controller,
    this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290.w,
      child: PinCodeTextField(
        readOnly: readOnly,
        onTap: onTap,
        appContext: context,
        length: length!,
        controller: controller,
        obscureText: true,
        obscuringCharacter: '●',
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: validator,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 48,
          borderWidth: 1,
          activeFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: AppColors.pink,
          inactiveColor: AppColors.greyB8,
          activeColor: AppColors.greyB8,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          //log('Completed');
        },
        onChanged: (value) {},
        beforeTextPaste: (text) {
         // log('Allowing to paste $text');
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }

}