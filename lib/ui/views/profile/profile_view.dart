import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/custom_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          splashRadius: 20.r,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: locator<NavigatorService>().goBack,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        fontFamily: sfPro,
                        color: AppColors.black33,
                      ),
                    ),
                    Text(
                      'example@email.com',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 9.sp,
                        color: AppColors.grey82,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 13.5.r,
                  backgroundColor: AppColors.blue00,
                  child: Text(
                    'JD',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Edit Profile',
              fontSize: 12.sp,
              height: 40.h,
              onTap: () {},
            ),
            SizedBox(height: 18.h),
            CustomListTile(
              leading: SvgPicture.asset(
                'account'.svg,
                width: 13.r,
                height: 13.r,
              ),
              onTap: () {},
              title: 'Account',
            ),
            Divider(
              height: 24.h,
            ),
            CustomListTile(
              leading: SvgPicture.asset(
                'favourite'.svg,
                width: 13.r,
                height: 13.r,
              ),
              onTap: () {},
              title: 'Favourite',
            ),
            Divider(
              height: 24.h,
            ),
            CustomListTile(
              leading: Icon(
                CupertinoIcons.square_stack_3d_up,
                color: AppColors.black23,
                size: 13.r,
              ),
              onTap: () {},
              title: 'How it works',
            ),
            Divider(
              height: 24.h,
            ),
            CustomListTile(
              leading: Icon(
                Icons.info_outline_rounded,
                color: AppColors.black23,
                size: 14.r,
              ),
              onTap: () {},
              title: 'Terms & Condition',
            ),
            Divider(
              height: 24.h,
            ),
            CustomListTile(
              leading: Icon(
                CupertinoIcons.chat_bubble,
                color: AppColors.black23,
                size: 14.r,
              ),
              onTap: () {},
              title: 'Help & Support',
            ),
            Divider(
              height: 24.h,
            ),
            CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'log_out'.svg,
                    width: 17.r,
                    height: 17.r,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: AppColors.blue00,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                CupertinoIcons.moon,
                size: 24.r,
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final VoidCallback onTap;
  const CustomListTile(
      {Key? key,
      required this.leading,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading,
          SizedBox(width: 13.w),
          Text(
            title,
            style: TextStyle(
              color: AppColors.black4F,
              fontSize: 15.sp,
            ),
          ),
          const Spacer(),
          Icon(
            CupertinoIcons.chevron_forward,
            size: 20.sp,
            color: AppColors.greyBD,
          ),
        ],
      ),
    );
  }
}
