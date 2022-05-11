import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
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
                      'Account',
                      style: TextStyle(
                        color: AppColors.black4F,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Divider(height: 0),
              _CustomAccountTile(
                title: 'Account Info',
                onTap: () {},
              ),
              const Divider(height: 0),
              _CustomAccountTile(
                title: 'Payment Method',
                onTap: () {},
              ),
              const Divider(height: 0),
              _CustomAccountTile(
                title: 'Manual transmission',
                onTap: () {},
              ),
              const Divider(height: 0),
              _CustomAccountTile(
                title: 'Notification settings',
                onTap: () {},
              ),
              const Divider(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomAccountTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const _CustomAccountTile({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              color: const Color(0xFF0D1C2E),
            ),
          ],
        ),
      ),
    );
  }
}
