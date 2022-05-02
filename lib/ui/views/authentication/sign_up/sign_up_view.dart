import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/authentication/sign_up/sign_up_view_model.dart';
import 'package:vecul/ui/views/verify_email/verify_email_view.dart';
import 'package:vecul/ui/widgets/custom_button.dart';
import 'package:vecul/ui/widgets/custom_text_field_with_label.dart';
import 'package:vecul/ui/widgets/route_animations/slide_page_route.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        // reverse: true,
        physics: const BouncingScrollPhysics(),
        child: ViewModelBuilder<SignUpViewModel>.reactive(
          createNewModelOnInsert: true,
          builder: (context, model, child) {
            return Form(
              key: model.formKey,
              autovalidateMode: model.validationMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50.h),
                  CustomTextFieldWithLabel(
                    label: 'Firstname',
                    hintText: 'John',
                    controller: model.firstnameController,
                    validator: model.firstnameValidator,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFieldWithLabel(
                    label: 'Lastname',
                    hintText: 'Doe',
                    controller: model.lastnameController,
                    validator: model.lastnameValidator,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFieldWithLabel(
                    label: 'Email',
                    hintText: 'johndoe@gmail.com',
                    controller: model.emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: model.emailValidator,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFieldWithLabel(
                    label: 'Password',
                    obscureText: true,
                    textFieldType: TextFieldType.password,
                    controller: model.passwordController,
                    validator: model.passwordValidator,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFieldWithLabel(
                    label: 'Confirm Password',
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    textFieldType: TextFieldType.password,
                    controller: model.confirmPasswordController,
                    validator: model.confirmPasswordValidator,
                  ),
                  SizedBox(height: 44.h),
                  CustomButton(
                    isLoading: model.isBusy,
                    text: 'Sign Up',
                    onTap: model.trySignUp,
                  ),
                  SizedBox(height: 70.h),
                ],
              ),
            );
          },
          viewModelBuilder: () => SignUpViewModel(),
        ),
      ),
    );
  }
}
