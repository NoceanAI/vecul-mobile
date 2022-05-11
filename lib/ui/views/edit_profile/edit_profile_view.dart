import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/core/models/user.dart';
import 'package:vecul/core/services/shared_prefs_service.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/dismiss_keyboard.dart';
import 'package:vecul/ui/widgets/underline_text_field.dart';

import 'edit_profile_view_model.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = SharedPrefsService().getUser();
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      builder: (context, model, child) {
        return DismissKeyboard(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 58.h),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              splashRadius: 20.r,
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 25.r,
                              ),
                              onPressed: locator<NavigatorService>().goBack,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color: AppColors.black4F,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CupertinoButton(
                              onPressed: () {

                              },
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  color: AppColors.blue00,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 29.h),
                      CupertinoButton(
                        onPressed: () {
                          model.uploadProfilePic();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.greyE0,
                              radius: 36.r,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Change profile photo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.blue00,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 28.h),
                    ],
                  ),
                ),
                Divider(height: 34.h, thickness: 1),
                Padding(
                  padding: EdgeInsets.only(left: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UnderlineTextField(
                        hintText: '${user.givenName} ${user.familyName}',
                        textInputType: TextInputType.text,
                        label: 'Name',
                      ),
                      const UnderlineTextField(
                        hintText: '+234 9012345678',
                        textInputType: TextInputType.text,
                        label: 'Phone Number',
                      ),
                      UnderlineTextField(
                        hintText: user.email,
                        textInputType: TextInputType.text,
                        label: 'Email',
                      ),
                      const UnderlineTextField(
                        hintText: 'Lagos, Nigeria',
                        textInputType: TextInputType.text,
                        label: 'Address',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }, viewModelBuilder: ()=> EditProfileViewModel(),
    );
  }
}


